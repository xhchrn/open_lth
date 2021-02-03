# 56 to 32 - part 2
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_32"
export mapping_headx4="0:0;5:1;6:2;7:3;8:4"
export mapping_secondx4="0:0;1:1;6:2;7:3;8:4"
export mapping_thirdx4="0:0;1:1;2:2;7:3;8:4"
export mapping_forthx4="0:0;1:1;2:2;3:3;8:4"
export mapping_tailx4="0:0;1:1;2:2;3:3;4:4"
for mapping in $mapping_headx4 $mapping_secondx4 $mapping_thirdx4 $mapping_forthx4 $mapping_tailx4; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

