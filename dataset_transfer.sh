# From cifar_resnet20 -> svhn_resnet32
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_32"
export source_dataset="cifar10"
export target_dataset="svhn"
export mapping="0:0;1:1,2;2:3,4"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From svhn_resnet20 -> cifar_resnet32
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_32"
export source_dataset="svhn"
export target_dataset="cifar10"
export mapping="0:0;1:1,2;2:3,4"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From svhn_resnet20 -> svhn_resnet32
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_32"
export source_dataset="svhn"
export target_dataset="svhn"
export mapping="0:0;1:1,2;2:3,4"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10



# From cifar_resnet32 -> svhn_resnet20
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_20"
export source_dataset="cifar10"
export target_dataset="svhn"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From svhn_resnet32 -> cifar_resnet20
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_20"
export source_dataset="svhn"
export target_dataset="cifar10"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From svhn_resnet32 -> svhn_resnet20
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_20"
export source_dataset="svhn"
export target_dataset="svhn"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth_dataset --num_workers 4 --default_hparams=cifar_resnet_20 \
    --dataset_name        $source_dataset --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_dataset_name $target_dataset --target_model_name $target_model --block_mapping "${mapping}" --levels=10