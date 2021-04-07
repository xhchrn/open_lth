# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import argparse
from dataclasses import dataclass
import os

from cli import shared_args
from foundations.runner import Runner
from foundations.step import Step
import models.registry
from platforms.platform import get_platform
from pruning.mask import Mask
from pruning.pruned_model import PrunedModel
from training import train
from training.desc import TrainingDesc


@dataclass
class TrainingRunner(Runner):
    replicate: int
    desc: TrainingDesc
    verbose: bool = True
    evaluate_every_epoch: bool = True

    @staticmethod
    def description():
        return "Train a model."

    @staticmethod
    def add_args(parser: argparse.ArgumentParser) -> None:
        shared_args.JobArgs.add_args(parser)
        TrainingDesc.add_args(parser, shared_args.maybe_get_default_hparams())

    @staticmethod
    def create_from_args(args: argparse.Namespace) -> 'TrainingRunner':
        return TrainingRunner(args.replicate, TrainingDesc.create_from_args(args),
                              not args.quiet, not args.evaluate_only_at_end)

    def display_output_location(self):
        print(self.desc.run_path(self.replicate))

    def run(self):
        if self.verbose and get_platform().is_primary_process:
            print('='*82 + f'\nTraining a Model (Replicate {self.replicate})\n' + '-'*82)
            print(self.desc.display)
            print(f'Output Location: {self.desc.run_path(self.replicate)}' + '\n' + '='*82 + '\n')
        self.desc.save(self.desc.run_path(self.replicate))

        #TODO: make mask and model init paths configurable
        init_path = os.path.join(get_platform().root, 'resnet18_lth')
        model = models.registry.load(init_path, Step.from_str('2ep218it', 1000),
                                    self.desc.model_hparams, self.desc.train_outputs)
        pruned_model = PrunedModel(model, Mask.load(init_path))

        train.standard_train(
            #models.registry.get(self.desc.model_hparams), self.desc.run_path(self.replicate),
            pruned_model, self.desc.run_path(self.replicate),
            self.desc.dataset_hparams, self.desc.training_hparams, evaluate_every_epoch=self.evaluate_every_epoch)
