# 20 to 32
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_32"
export mapping="0:0;1:1,2;2:3,4"
python3 open_lth.py lottery_branch change_depth_linear_connect --num_workers 8 --default_hparams=cifar_resnet_20 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# 32 to 32
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_32"
export mapping="0:0;1:1;2:2;3:3;4:4"
python3 open_lth.py lottery_branch change_depth_linear_connect --num_workers 8 --default_hparams=cifar_resnet_20 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# 14 to 32
export source_model="cifar_resnet_14"
export target_model="cifar_resnet_32"
export mapping="0:0;1:1,2,3,4"
python3 open_lth.py lottery_branch change_depth_linear_connect --num_workers 8 --default_hparams=cifar_resnet_20 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10