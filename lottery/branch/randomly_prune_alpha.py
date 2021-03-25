# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import os
import torch

from lottery.branch import base
import models.registry
from pruning.mask import Mask
from pruning.pruned_model import PrunedModel
from training import train
from utils.tensor_utils import vectorize, unvectorize, shuffle_tensor, shuffle_state_dict, random_mask_state_dict_alpha


class Branch(base.Branch):
    def branch_function(self,
                        seed: int,
                        strategy: str = 'layerwise',
                        start_at: str = 'rewind',
                        layers_to_ignore: str = '',
                        alphas: str = None,
                        runs: int = 1,
                        overwrite: bool = False):
        # Randomize the mask.
        mask = Mask.load(self.level_root)

        # Get list of alphas
        alphas = list(map(float, alphas.split(',')))

        runs_counter = 0
        for a, alpha in enumerate(alphas):
            for r in range(int(1e10)):
                if runs_counter >= runs:
                    break
                working_dir = os.path.join(self.branch_root, f'alpha_{alpha}', f'run_{r}')
                if os.path.exists(working_dir) and not overwrite:
                    continue

                cur_seed = seed + a * 1000 + r * 100
                new_mask = Mask(random_mask_state_dict_alpha(mask, alpha, cur_seed))

                # Reset the masks of any layers that shouldn't be pruned.
                if layers_to_ignore:
                    for k in layers_to_ignore.split(','):
                        new_mask[k] = torch.ones_like(new_mask[k])

                # Save the new mask.
                new_mask.save(working_dir)

                # Determine the start step.
                if start_at == 'init':
                    start_step = self.lottery_desc.str_to_step('0ep')
                    state_step = start_step
                elif start_at == 'end':
                    start_step = self.lottery_desc.str_to_step('0ep')
                    state_step = self.lottery_desc.train_end_step
                elif start_at == 'rewind':
                    start_step = self.lottery_desc.train_start_step
                    state_step = start_step
                else:
                    raise ValueError(f'Invalid starting point {start_at}')

                # Train the model with the new mask.
                model = PrunedModel(
                    models.registry.load(self.level_root, state_step, self.lottery_desc.model_hparams),
                    new_mask
                )
                train.standard_train(model, working_dir,
                                     self.lottery_desc.dataset_hparams,
                                     self.lottery_desc.training_hparams,
                                     start_step=start_step,
                                     verbose=self.verbose)

                runs_counter += 1


    @staticmethod
    def description():
        return "Randomly prune the model, with `alphas` controlling the simiarity to (uniform) random pruning or a winning ticket."

    @staticmethod
    def name():
        return 'randomly_prune_alpha'
