# 32 to 56
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_56"
export mapping_inter1234x2="0:0;1:1,2;2:3,4;3:5,6;4:7,8"
export mapping_head4x2="0:0;1:1,5;2:2,6;3:3,7;4:4,8"
export mapping_head1x5="0:0;1:1,2,3,4,5;2:6;3:7;4:8"
export mapping_second1x5="0:0;1:1;2:2,3,4,5,6;3:7;4:8"
export mapping_third1x5="0:0;1:1;2:2;3:3,4,5,6,7;4:8"
export mapping_tail1x5="0:0;1:1;2:2;3:3;4:4,5,6,7,8"
for mapping in $mapping_inter1234x2 $mapping_head4x2 $mapping_head1x5 $mapping_second1x5 $mapping_third1x5 $mapping_tail1x5; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

