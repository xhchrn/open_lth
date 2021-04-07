from torch import Tensor
from torch.autograd import Function
from torch.optim.optimizer import Optimizer
from torch.optim import Adam
from collections import OrderedDict
import numpy as np
from typing import TypeVar, Union, Tuple, Optional, Callable
import torch

class Bop(Optimizer):
    def __init__(
        self,
        binary_params,
        bn_params,
        **args,
    ):

        if bn_params is not None and len(bn_params) != 0:
            self.bn_params_exist = True
        else:
            self.bn_params_exist = False

        # if not 0 < args.ar[0] < 1:
        #     raise ValueError(
        #         "given adaptivity rate {} is invalid; should be in (0, 1) (excluding endpoints)".format(
        #             args.ar[0]
        #         )
        #     )
        if not 0 < args['ar'] < 1:
            raise ValueError(
                "given adaptivity rate {} is invalid; should be in (0, 1) (excluding endpoints)".format(
                    args['ar']
                )
            )
        if args['threshold'] < 0:
            raise ValueError(
                "given threshold {} is invalid; should be > 0".format(args['threshold'])
            )

        self.total_weights = {}
        if self.bn_params_exist:
            self._adam = Adam(bn_params, lr=args['adam_lr'][0])
            start_scale = 1
            end_scale = args['adam_lr'][1] / args['adam_lr'][0]
            delta_scale = start_scale - end_scale
            self._scheduler_adam = torch.optim.lr_scheduler.LambdaLR(self._adam, lambda step: start_scale - (step / args['total_iters'])*(delta_scale),last_epoch=-1)

        defaults = dict(adaptivity_rate=args['ar'], threshold=args['threshold'])
        super(Bop, self).__init__(
            binary_params, defaults
        )

    def step(self, closure: Optional[Callable[[], float]] = ..., ar=None, threshold=None):
        if self.bn_params_exist:
            self._adam.step()
            self._scheduler_adam.step()
        # flips = {None}
        for i, group in enumerate(self.param_groups):
            params = group["params"]
            y = group["adaptivity_rate"]
            t = group["threshold"]
            # flips = {}

            if ar is not None:
                y = ar
            # print("adaptivity_rate: {}".format(y))

            if threshold is not None:
                t = threshold

            # print(f'param_groups: {i}, adaptivity_rate: {y}, threshold: {t}')
            for param_idx, p in enumerate(params):
                # print('before', torch.unique(p.data).detach().cpu().numpy())

                grad = p.grad.data
                state = self.state[p]
                # print(param_idx, p.shape)

                if "moving_average" not in state:
                    m = state["moving_average"] = torch.clone(grad).detach()
                else:
                    m: Tensor = state["moving_average"]

                    m.mul_((1 - y))
                    m.add_(grad.mul(y))
                mask = (m.abs() >= t) * (m.sign() == p.sign())
                mask = mask.double() * -1
                mask[mask == 0] = 1

                state["flips"] = (mask == -1).sum().item()
                # flips[param_idx] = (mask == -1).sum().item()

                p.data.mul_(mask)
                # if -1 in mask:
                # print('after', torch.unique(p.data).detach().cpu().numpy())
        # print('step end')
        # print(len(self.state))
        # return flips

    def zero_grad(self) -> None:
        super().zero_grad()
        if self.bn_params_exist:
            self._adam.zero_grad()
    
    def decay_ar(self, decay_ratio):
        for i, group in enumerate(self.param_groups):
            # params = group["params"]
            group["adaptivity_rate"] *= decay_ratio
