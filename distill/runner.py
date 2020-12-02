# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import argparse
from copy import deepcopy
from dataclasses import dataclass

from cli import shared_args
from foundations.runner import Runner
import models.registry
from platforms.platform import get_platform
from training import train
from distill.desc import DistillDesc
import pruning.registry
from pruning.mask import Mask
from pruning.pruned_model import PrunedModel


@dataclass
class DistillRunner(Runner):
    replicate: int
    desc: DistillDesc
    verbose: bool = True
    evaluate_every_epoch: bool = True

    @staticmethod
    def description():
        return "Train a model with distillation."

    @staticmethod
    def add_args(parser: argparse.ArgumentParser) -> None:
        shared_args.JobArgs.add_args(parser)
        DistillDesc.add_args(parser, shared_args.maybe_get_default_hparams())

    @staticmethod
    def create_from_args(args: argparse.Namespace) -> 'DistillRunner':
        return DistillRunner(args.replicate, DistillDesc.create_from_args(args),
                              not args.quiet, not args.evaluate_only_at_end)

    def display_output_location(self):
        print(self.desc.run_path(self.replicate))

    def run(self):
        location = self.desc.run_path(self.replicate)
        if self.verbose and get_platform().is_primary_process:
            print('='*82 + f'\nTraining a Model with Knowledge Distillation (Replicate {self.replicate})\n' + '-'*82)
            print(self.desc.display)
            print(f'Output Location: {self.desc.run_path(self.replicate)}' + '\n' + '='*82 + '\n')
        if get_platform().is_primary_process: self.desc.save(location)

        # if get_platform().is_primary_process: self._establish_initial_weights()
        # get_platform().barrier()

        # Get the student model
        student = models.registry.get(self.desc.model_hparams, outputs=self.desc.train_outputs)
        # Get the teacher model
        teacher_model_hparams = deepcopy(self.desc.model_hparams)
        teacher_model_hparams.model_name = self.desc.distill_hparams.teacher_model_name
        teacher = models.registry.load_from_file(
            self.desc.teacher_hparams.teacher_ckpt,
            teacher_model_hparams, self.desc.train_outputs
        )
        teacher_mask = Mask.load(self.desc.distill_hparams.teacher_mask)
        teacher = PrunedModel(teacher, teacher_mask)
        # Run training with knowledge distillation
        train.distill_train(student, teacher, location,
                            self.desc.dataset_hparams, self.desc.training_hparams,
                            evaluate_every_epoch=self.evaluate_every_epoch)

    # def _establish_initial_weights(self):
    #     location = self.desc.run_path(self.replicate)
    #     if models.registry.exists(location, self.desc.start_step): return

    #     new_model = models.registry.get(self.desc.model_hparams, outputs=self.desc.train_outputs)

    #     new_model.save(location, self.desc.train_start_step)
