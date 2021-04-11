# export replicate=118
python open_lth.py lottery --num_workers 32 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate

python open_lth.py lottery_branch randomly_reinitialize --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate
python open_lth.py lottery_branch randomly_prune --strategy layerwise --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate
python open_lth.py lottery_branch randomly_prune --strategy global --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate

export source_model="imagenet_resnet_18"
export target_model="imagenet_resnet_26"
export mapping1="0:0;1:1|0:0;1:1,2|0:0;1:1,2,3|0:0;1:1,2"
for mapping in $mapping1; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=6
done

export source_model="imagenet_resnet_18"
export target_model="imagenet_resnet_34"
export mapping1="0:0;1:1,2|0:0;1:1,2,3|0:0;1:1,2,3,4,5|0:0;1:1,2"
for mapping in $mapping1; do
    python open_lth.py lottery_branch change_depth --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=6
done
