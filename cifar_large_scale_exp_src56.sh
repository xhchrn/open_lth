# 56 to 14
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_14"
export mapping_inter="0:0;1:1"
export mapping_head="0:0;8:1"
export mapping_tail="0:0;1:1"
for mapping in $mapping_inter $mapping_head $mapping_tail; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

# 56 to 20
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_20"
export mapping_inter="0:0;1:1;5:2"
export mapping_head="0:0;7:1;8:2"
export mapping_tail="0:0;1:1;2:2"
for mapping in $mapping_inter $mapping_head $mapping_tail; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

# 56 to 44
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_44"
export mapping_inter="0:0;1:1;2:2;3:3;4:4;5:5;7:6"
export mapping_head="0:0;3:1;4:2;5:3;6:4;7:5;8:6"
export mapping_tail="0:0;1:1;2:2;3:3;4:4;5:5;6:6"
for mapping in $mapping_inter $mapping_head $mapping_tail; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

