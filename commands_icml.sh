for a in *.tar
do
    tar xvf $a --one-top-level
done

# VGG 16
rsync -avh -e ssh --progress --exclude checkpoint.pth /datadrive_c/xiaohan/open_lth_data_icml/lottery_0ff52d06ca095677f4bb2a77d71ecb32 xiaohan@13.68.155.245:/datadrive_c/xiaohan/open_lth_data/
# ResNet 56
rsync -avh -e ssh --progress --exclude checkpoint.pth /datadrive_c/xiaohan/open_lth_data_icml/lottery_77378b9059907f2145d5a60a20b91043 xiaohan@13.68.155.245:/datadrive_c/xiaohan/open_lth_data/
# ResNet 32
rsync -avh -e ssh --progress --exclude checkpoint.pth /datadrive_c/xiaohan/open_lth_data_icml/lottery_d1bce129beebea6ae76df1c61e53d1e6 xiaohan@13.68.155.245:/datadrive_c/xiaohan/open_lth_data/


# ResNet 18 - VM2
rsync -avh -e ssh --progress --exclude checkpoint.pth --exclude '***/*branch*' /datadrive_c/xiaohan/open_lth_data_icml/lottery_0491d622b74de2be9f3184f54587e9da xiaohan@13.72.119.132:/datadrive_c/xiaohan/open_lth_data/
# ResNet 18 - quad2 to VM8
rsync -avh -e ssh --progress --exclude checkpoint.pth /datadrive_b/xiaohan/open_lth_data/lottery_0491d622b74de2be9f3184f54587e9da xiaohan@40.87.111.214:/datadrive_c/xiaohan/open_lth_data/

# ResNet 26 - VM2
rsync -avh -e ssh --progress --exclude checkpoint.pth --exclude '***/*branch*' /datadrive_c/xiaohan/open_lth_data_icml/lottery_6459b16f9b0ca04841bb6023bb4059f8 xiaohan@13.72.119.132:/datadrive_c/xiaohan/open_lth_data/
# ResNet 34 - VM3
rsync -avh -e ssh --progress --exclude checkpoint.pth --exclude '***/*branch*' /datadrive_c/xiaohan/open_lth_data_icml/lottery_a14b80b583d414c8ad8e3601e9f09026 xiaohan@13.68.155.245:/datadrive_c/xiaohan/open_lth_data/



python open_lth.py lottery --default_hparams=cifar_resnet_20 --levels=3 --rewinding_steps=500it


haber2018learning,

python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "0:0;5:1;6:2;7:3;8:4" --levels=0-16 --display_output_location

export source_model="cifar_resnet_20"
export target_model="cifar_resnet_14"
export mapping_head="0:0;2:1"
export mapping_tail="0:0;1:1"
# export mapping_tail="0:0;1:1"
# export mapping_first="0:0;2:1"
# export mapping_last="0:0;1:1"
for mapping in $mapping_head $mapping_tail; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --rewinding_steps 1000it --replicate=42 \
        --target_model_name cifar_resnet_14 --block_mapping "0:0;2:1" --levels=0-16 --display_output_location
done

export source_model="cifar_resnet_32"
export target_model="cifar_resnet_14"
export mapping_head3="0:0;4:1"
export mapping_head2tail1="0:0;3:1"
export mapping_head1tail2="0:0;2:1"
export mapping_tail3="0:0;1:1"

python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --rewinding_steps 1000it --replicate=$replicate \
	--target_model_name cifar_resnet_32 --block_mapping "0:0;1:1;2:2;3:3;4:4" --levels=0-16


python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it --replicate=42 \
        --target_model_name cifar_resnet_32 --block_mapping "0:0;1:1;2:2;3:3;4:4" --levels=0-16 --display_output_location


# VGG

python open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --rewinding_steps 200it --replicate=42 \
        --target_model_name cifar_vgg_16 --block_mapping "0:0;1:1|0:0;1:1|0:0;1:1,2|0:0;1:1,2|0:0;1:1,2" --levels=0-16 --display_output_location


export replicate=726
export source_model="cifar_resnet_56"
export target_model="cifar_resnet_32"

export mapping="0:0;5:1;6:2;7:3;8:4"
export mapping="0:0;1:1;6:2;7:3;8:4"
export mapping="0:0;1:1;2:2;7:3;8:4"
export mapping="0:0;1:1;2:2;3:3;8:4"

python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16


# Change depth random mask

# 32 to 56
export source_model="cifar_resnet_32"
export target_model="cifar_resnet_56"
export mapping="0:0;1:1,2;2:3,4;3:5,6;4:7,8"
# export mapping_head4x2="0:0;1:1,5;2:2,6;3:3,7;4:4,8"
# export mapping_head1x5="0:0;1:1,2,3,4,5;2:6;3:7;4:8"
# export mapping_second1x5="0:0;1:1;2:2,3,4,5,6;3:7;4:8"
# export mapping_third1x5="0:0;1:1;2:2;3:3,4,5,6,7;4:8"
# export mapping_tail1x5="0:0;1:1;2:2;3:3;4:4,5,6,7,8"
python3 open_lth.py lottery_branch change_depth_random_mask --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16 --seed 7
