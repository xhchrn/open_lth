# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import copy
from lottery.branch import base
import models.registry
from pruning.mask import Mask
from pruning.pruned_model import PrunedModel
from training import train
from lottery.branch.morphism import change_depth


class Branch(base.Branch):
    def branch_function(
        self,
        target_model_name: str = None,
        block_mapping: str = None,
        start_at_step_zero: bool = False
    ):
        # Process the mapping
        # A valid string format of a mapping is like:
        #   `0:0;1:1,2;2:3,4;3:5,6;4:7,8`
        mapping = dict()
        mapping_strs = block_mapping.split(';')
        try:
            for s in mapping_strs:
                src_id_str, tgt_ids_str = s.split(':')
                src_id = int(src_id_str)
                tgt_ids = [int(t) for t in tgt_ids_str.split(',')]
                mapping[src_id] = tgt_ids
        except:
            raise RuntimeError('Invalid block mapping string.')

        # Load source model at `train_start_step`
        src_mask = Mask.load(self.level_root)
        start_step = self.lottery_desc.str_to_step('0it') if start_at_step_zero else self.lottery_desc.train_start_step
        # model = PrunedModel(models.registry.get(self.lottery_desc.model_hparams), src_mask)
        model = PrunedModel(models.registry.load(self.level_root, start_step, self.lottery_desc.model_hparams), mask)

        # Create target model
        target_model_hparams = copy.deepcopy(self.lottery_desc.model_hparams)
        target_model_hparams.model_name = target_model_name
        target_model = models.registry.get(target_model_hparams)
        target_ones_mask = Mask.ones_like(target_model)
        
        # Do the morphism
        target_sd = change_depth(model.model.state_dict(), target_model.state_dict(), mapping)
        target_model.load_state_dict(target_sd)
        target_mask = change_depth(src_mask, target_ones_mask, mapping)
        target_model = PrunedModel(target_model, target_mask)

        # Save and run a standard train
        target_mask.save(self.branch_root)
        train.standard_train(target_model, self.branch_root, self.lottery_desc.dataset_hparams,
                             self.lottery_desc.training_hparams, start_step=start_step, verbose=self.verbose)

    @staticmethod
    def description():
        return "Change the depth of the source network."

    @staticmethod
    def name():
        return 'change_depth'
