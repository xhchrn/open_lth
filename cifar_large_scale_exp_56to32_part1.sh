# 56 to 32
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_32"
export mapping_inter1357="0:0;1:1;3:2;5:3;7:4"
export mapping_inter2468="0:0;2:1;4:2;6:3;8:4"
export mapping_inter1478="0:0;1:1;4:2;7:3;8:4"
export mapping_inter1258="0:0;1:1;2:2;5:3;8:4"
export mapping_inter1236="0:0;1:1;2:2;3:3;6:4"
export mapping_inter1458="0:0;1:1;4:2;5:3;8:4"
# export mapping_headx4="0:0;5:1;6:2;7:3;8:4"
# export mapping_secondx4="0:0;1:1;6:2;7:3;8:4"
# export mapping_thirdx4="0:0;1:1;2:2;7:3;8:4"
# export mapping_forthx4="0:0;1:1;2:2;3:3;8:4"
# export mapping_tail="0:0;1:1;2:2;3:3;4:4"
for mapping in $mapping_inter1357 $mapping_inter2468 $mapping_inter1478 $mapping_inter1258 $mapping_inter1236 $mapping_inter1458; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

