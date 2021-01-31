export source_model="imagenet_resnet_34"
export target_model="imagenet_resnet_18"
export mapping_head="0:0;2:1|0:0;3:1|0:0;5:1|0:0;2:1"
export mapping_tail="0:0;1:1|0:0;1:1|0:0;1:1|0:0;1:1"
for mapping in $mapping_head $mapping_tail; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name $source_model --levels=6 --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=6
done

export source_model="imagenet_resnet_34"
export target_model="imagenet_resnet_26"
export mapping_head="0:0;2:1|0:0;2:1;3:2|0:0;3:1;4:2;5:3|0:0;1:1;2:2"
export mapping_tail="0:0;1:1|0:0;1:1;2:2|0:0;1:1;2:2;3:3|0:0;1:1;2:2"
export mapping_inter="0:0;2:1|0:0;2:1;3:2|0:0;1:1;2:2;4:3|0:0;1:1;2:2"
# export mapping_inter="0:0;1:1|0:0;1:1;2:2|0:0;1:1;2:2;3:3|0:0;1:1;2:2"
for mapping in $mapping_head $mapping_tail $mapping_inter_head; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name $source_model --levels=6 --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=6
done

