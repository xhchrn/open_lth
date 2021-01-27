# 32 to 56
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_56"
export mapping_head2x3="0:0;1:1,3,5;2:2,4,6;3:7;4:8"
export mapping_tail2x3="0:0;1:1;2:2;3:3,5,7;4:4,6,8"
export mapping_middle2x3="0:0;1:1;2:2,4,6;3:3,5,7;4:8"
export mapping_inter12x3="0:0;1:1,2,3;2:4,5,6;3:7;4:8"
export mapping_inter23x3="0:0;1:1;2:2,3,4;3:5,6,7;4:8"
export mapping_inter34x3="0:0;1:1;2:2;3:3,4,5;4:6,7,8"
for mapping in $mapping_head2x3 $mapping_tail2x3 $mapping_middle2x3 $mapping_inter12x3 $mapping_inter23x3 $mapping_inter34x3; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

