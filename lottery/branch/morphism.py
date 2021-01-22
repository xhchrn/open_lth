# Copyright (c) Facebook, Inc. and its affiliates.

# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import copy
import numpy as np


def change_depth(model_name, src, dst_sd, mapping):
    if 'resnet' in model_name:
        return change_depth_resnet(src, dst_sd, mapping)
    else:
        raise NotImplementedError(f'Depth morphism method is not implemeted yet for {model_name}')


def change_depth_resnet(src_sd, dst_sd, mapping):
    dst_sd = copy.deepcopy(dst_sd)

    # get the milestone for stages
    src_milestones = set([0])
    dst_milestones = set([0])
    for k in src_sd.keys():
        if 'blocks' in k and 'shortcut' in k:
            src_milestones.add(int(k.split('.')[1]))
    for k in dst_sd.keys():
        if 'blocks' in k and 'shortcut' in k:
            dst_milestones.add(int(k.split('.')[1]))    
    src_milestones = sorted(src_milestones)
    dst_milestones = sorted(dst_milestones)
    src_stage_len = src_milestones[1]
    dst_stage_len = dst_milestones[1]
    print(src_stage_len, dst_stage_len)
    shallow_to_deep = src_stage_len <= dst_stage_len
    
    overwritten_keys = []
    
    for k,v in src_sd.items():
        if 'blocks' in k:
            splitted_key = k.split('.')
            src_block_id = int(splitted_key[1])
            for i in range(len(src_milestones)-1, -1, -1):
                if src_block_id >= src_milestones[i]:
                    stage_id = i
                    break
            src_local_id = src_block_id - src_milestones[stage_id]
            
            dst_local_id_list = mapping.get(src_local_id, [])
            
            for dst_local_id in dst_local_id_list:
                dst_block_id = stage_id * dst_stage_len + dst_local_id
                dst_key = copy.deepcopy(splitted_key)
                dst_key[1] = str(dst_block_id)
                dst_key = '.'.join(dst_key)
                assert dst_key in dst_sd
                dst_sd[dst_key] = v.clone()
                overwritten_keys.append(dst_key)
        else:
            # directly copy the first conv and bn layer and the last linear layer
            assert k in dst_sd
            dst_sd[k] = v
            overwritten_keys.append(k)

    all_overwritten = True
    for k in dst_sd.keys():
        all_overwritten = all_overwritten and k in overwritten_keys
    assert all_overwritten
            
    return dst_sd

