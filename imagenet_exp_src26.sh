export source_model="imagenet_resnet_26"
export target_model="imagenet_resnet_18"
export mapping1="0:0;1:1|0:0;1:1|0:0;1:1|0:0;1:1"
for mapping in $mapping1; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name $source_model --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-5
done

export source_model="imagenet_resnet_26"
export target_model="imagenet_resnet_34"
export mapping1="0:0;1:1,2|0:0;1:1,2;2:3|0:0;1:1,2;2:3,4;3:5|0:0;1:1;2:2"
for mapping in $mapping1; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name $source_model --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-5
done
