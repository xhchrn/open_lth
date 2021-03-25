# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import torch

import typing


def vectorize(state_dict: typing.Dict[str, torch.Tensor]):
    """Convert a state dict into a single column Tensor in a repeatable way."""

    return torch.cat([state_dict[k].reshape(-1) for k in sorted(state_dict.keys())])


def unvectorize(vector: torch.Tensor, reference_state_dict: typing.Dict[str, torch.Tensor]):
    """Convert a vector back into a state dict with the same shapes as reference state_dict."""

    if len(vector.shape) > 1: raise ValueError('vector has more than one dimension.')

    state_dict = {}
    for k in sorted(reference_state_dict.keys()):
        if vector.nelement() == 0: raise ValueError('Ran out of values.')

        size, shape = reference_state_dict[k].nelement(), reference_state_dict[k].shape
        this, vector = vector[:size], vector[size:]
        state_dict[k] = this.reshape(shape)

    if vector.nelement() > 0: raise ValueError('Excess values.')
    return state_dict


def perm(N, seed: int = None):
    """Generate a tensor with the numbers 0 through N-1 ordered randomly."""

    gen = torch.Generator()
    if seed is not None: gen.manual_seed(seed)
    perm = torch.normal(torch.zeros(N), torch.ones(N), generator=gen)
    return torch.argsort(perm)


def shuffle_tensor(tensor: torch.Tensor, seed: int = None):
    """Randomly shuffle the elements of a tensor."""

    shape = tensor.shape
    return tensor.reshape(-1)[perm(tensor.nelement(), seed=seed)].reshape(shape)


def shuffle_state_dict(state_dict: typing.Dict[str, torch.Tensor], seed: int = None):
    """Randomly shuffle each of the tensors in a state_dict."""

    output = {}
    for i, k in enumerate(sorted(state_dict.keys())):
        output[k] = shuffle_tensor(state_dict[k], seed=None if seed is None else seed+i)
    return output


def random_mask_tensor_alpha(tensor: torch.Tensor, alpha: float, seed: int = None):
    """Randomly shuffle the elements of a tensor, with `alpha` controlling
       its similarity to a (uniform) random mask (alpha=0) or a winning
       ticket (alpha=1)."""

    shape = tensor.shape
    num_pruned = int((tensor == 0).sum().item())
    new_score = torch.rand(size=tensor.size(), dtype=torch.float32)
    new_score[tensor == 0] *= alpha
    threshold = torch.sort(new_score.reshape(-1))[0][num_pruned]
    new_mask = (new_score > threshold).to(dtype=tensor.dtype, device=tensor.device)
    return new_mask


def random_mask_state_dict_alpha(state_dict: typing.Dict[str, torch.Tensor],
                                 alpha: float,
                                 seed: int = None):
    """Randomly mask each of the tensors in a state_dict, with `alpha` controlling
       its similarity to a (uniform) random mask (alpha=0) or a winning ticket (alpha=1)."""

    output = {}
    for i, k in enumerate(sorted(state_dict.keys())):
        output[k] = random_mask_tensor_alpha(state_dict[k],
                                             alpha,
                                             seed=None if seed is None else seed+i)
    return output
