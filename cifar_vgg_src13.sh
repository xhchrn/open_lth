export source_model="cifar_vgg_13"
export target_model="cifar_vgg_16"
export mapping_append="0:0;1:1|0:0;1:1|0:0;1:1,2|0:0;1:1,2|0:0;1:1,2"
for mapping in $mapping_append; do
    python open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_vgg_16 --model_name $source_model --rewinding_steps 200it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

export source_model="cifar_vgg_13"
export target_model="cifar_vgg_19"
# export mapping_append="0:0;1:1|0:0;1:1|0:0,2;1:1,3|0:0,2;1:1,3|0:0,2;1:1,3"
export mapping_inter="0:0;1:1|0:0;1:1|0:0;1:1,2,3|0:0;1:1,2,3|0:0;1:1,2,3"
for mapping in $mapping_inter; do
    python open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_vgg_16 --model_name $source_model --rewinding_steps 200it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

