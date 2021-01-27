# 32 to 14
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_14"
# export mapping_inter="0:0;1:1"
export mapping_head3="0:0;4:1"
export mapping_head2tail1="0:0;3:1"
export mapping_head1tail2="0:0;2:1"
export mapping_tail3="0:0;1:1"
for mapping in $mapping_head3 $mapping_head2tail1 $mapping_head1tail2 $mapping_tail3; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 32 to 20
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_20"
export mapping_inter13="0:0;1:1;3:2"
export mapping_inter24="0:0;2:1;4:2"
export mapping_head2="0:0;3:1;4:2"
export mapping_tail2="0:0;1:1;2:2"
export mapping_middle2="0:0;1:1;4:2"
for mapping in $mapping_inter13 $mapping_inter24 $mapping_head2 $mapping_tail2 $mapping_middle2; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 32 to 44
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_44"
export mapping_inter12x2="0:0;1:1,2;2:3,4;3:5;4:6"
# export mapping_inter13x2="0:0;1:1,2;2:3;3:4,5;4:6"
# export mapping_inter14x2="0:0;1:1,2;2:3;3:4;4:5,6"
# export mapping_inter23x2="0:0;1:1;2:2,3;3:4,5;4:6"
# export mapping_inter24x2="0:0;1:1;2:2,3;3:4;4:5,6"
export mapping_inter34x2="0:0;1:1;2:2;3:3,4;4:5,6"
export mapping_head2="0:0;1:1,3;2:2,4;3:5;4:6"
export mapping_tail2="0:0;1:1;2:2;3:3,5;4:4,6"
# export mapping_middle2="0:0;1:1;2:2,4;3:3,5;4:6"
export mapping_head1="0:0;1:1,2,3;2:4;3:5;4:6"
# export mapping_second="0:0;1:1;2:2,3,4;3:5;4:6"
# export mapping_third="0:0;1:1;2:2;3:3,4,5;4:6"
export mapping_tail1="0:0;1:1;2:2;3:3;4:4,5,6"
for mapping in $mapping_inter12x2 $mapping_inter13x2 $mapping_inter14x2 $mapping_inter23x2 $mapping_inter24x2 $mapping_inter34x2 $mapping_head2 $mapping_tail2 $mapping_middle2 $mapping_head1 $mapping_second $mapping_third $mapping_tail1; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

