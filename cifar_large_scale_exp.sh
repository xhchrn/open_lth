# export replicate=1

# 14: lottery_47a5d7b2f955ca86f12cc1e70e1ce588
# 20: lottery_231c88c353aecc912eada550c58eff10
# 32: lottery_d1bce129beebea6ae76df1c61e53d1e6
# 44: lottery_9177ecc955f02f6db621dca334ce6f72
# 56: lottery_77378b9059907f2145d5a60a20b91043
# python3 open_lth.py lottery --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --rewinding_steps 1000it --level=16 --replicate=$replicate;\
# python3 open_lth.py lottery --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --rewinding_steps 1000it --level=16 --replicate=$replicate;\
# python3 open_lth.py lottery --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it --level=16 --replicate=$replicate;\
# python3 open_lth.py lottery --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 --rewinding_steps 1000it --level=16 --replicate=$replicate;\
# python3 open_lth.py lottery --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --rewinding_steps 1000it --level=16 --replicate=$replicate


# 14 to 20
export source_model="cifar_resnet_14"
export target_model="cifar_resnet_20"
export mapping_inter="0:0;1:1,2"
# export mapping_head="0:0;1:1,2"
# export mapping_tail="0:0;1:1,2"
# export mapping_first="0:0;1:1,2"
# export mapping_last="0:0;1:1,2"
for mapping in $mapping_inter; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 14 to 32
export source_model="cifar_resnet_14"
export target_model="cifar_resnet_32"
export mapping_inter="0:0;1:1,2,3,4"
# export mapping_head="0:0;1:1,2,3,4"
# export mapping_tail="0:0;1:1,2,3,4"
# export mapping_first="0:0;1:1,2,3,4"
# export mapping_last="0:0;1:1,2,3,4"
for mapping in $mapping_inter; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 14 to 44
export source_model="cifar_resnet_14"
export target_model="cifar_resnet_44"
export mapping_inter="0:0;1:1,2,3,4,5,6"
# export mapping_head="0:0;1:1,2,3,4,5,6"
# export mapping_tail="0:0;1:1,2,3,4,5,6"
# export mapping_first="0:0;1:1,2,3,4,5,6"
# export mapping_last="0:0;1:1,2,3,4,5,6"
for mapping in $mapping_inter; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 14 to 56
export source_model="cifar_resnet_14"
export target_model="cifar_resnet_56"
export mapping_inter="0:0;1:1,2,3,4,5,6,7,8"
# export mapping_head="0:0;1:1,2,3,4,5,6,7,8"
# export mapping_tail="0:0;1:1,2,3,4,5,6,7,8"
# export mapping_first="0:0;1:1,2,3,4,5,6,7,8"
# export mapping_last="0:0;1:1,2,3,4,5,6,7,8"
for mapping in $mapping_inter; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

# 20 to 14
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_14"
export mapping_head="0:0;2:1"
export mapping_tail="0:0;1:1"
# export mapping_tail="0:0;1:1"
# export mapping_first="0:0;2:1"
# export mapping_last="0:0;1:1"
for mapping in $mapping_head $mapping_tail; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 20 to 32
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_32"
export mapping_inter="0:0;1:1,2;2:3,4"
export mapping_head1="0:0;1:1,3;2:2,4"
export mapping_head2="0:0;1:1,2,3;2:4"
export mapping_tail1="0:0;1:1;2:2,3,4"
for mapping in $mapping_inter $mapping_head1 $mapping_head2 $mapping_tail1; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 20 to 44
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_44"
export mapping_inter3="0:0;1:1,2,3;2:4,5,6"
export mapping_inter2_head2="0:0;1:1,2,3,4;2:5,6"
export mapping_inter2_tail2="0:0;1:1,2;2:3,4,5,6"
export mapping_head1="0:0;1:1,2,3,4,5;2:6"
export mapping_head2="0:0;1:1,3,5;2:2,4,6"
export mapping_tail1="0:0;1:1;2:2,3,4,5,6"
for mapping in $mapping_inter3 $mapping_inter2_head2 $mapping_inter2_tail2 $mapping_head1 $mapping_head2 $mapping_tail1; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done
# 20 to 56
export source_model="cifar_resnet_20"
export target_model="cifar_resnet_56"
export mapping_inter4="0:0;1:1,2,3,4;2:5,6,7,8"
export mapping_inter3_head2="0:0;1:1,2,3,4,5;2:6,7,8"
export mapping_inter3_tail2="0:0;1:1,2,3;2:4,5,6,7,8"
export mapping_inter2_head4="0:0;1:1,2,5,6;2:3,4,7,8"
export mapping_inter2_tail2="0:0;1:1,2;2:3,4,5,6,7,8"
export mapping_head1="0:0;1:1,2,3,4,5,6,7;2:8"
export mapping_head2="0:0;1:1,3,5,7;2:2,4,6,8"
export mapping_tail1="0:0;1:1;2:2,3,4,5,6,7,8"
for mapping in $mapping_inter4 $mapping_inter3_head2 $mapping_inter3_tail2 $mapping_inter2_head2 $mapping_inter2_head4 $mapping_inter2_tail2 $mapping_head1 $mapping_head2 $mapping_tail1; do
    python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
        --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
done

# # 32 to 14
# export source_model="cifar_resnet_32"
# export target_model="cifar_resnet_14"
# export mapping_inter="0:0;1:1"
# export mapping_head="0:0;4:1"
# export mapping_tail="0:0;1:1"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 32 to 20
# export source_model="cifar_resnet_32"
# export target_model="cifar_resnet_20"
# export mapping_inter="0:0;1:1;3:2"
# export mapping_head="0:0;3:1;4:2"
# export mapping_tail="0:0;1:1;2:2"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 32 to 44
# export source_model="cifar_resnet_32"
# export target_model="cifar_resnet_44"
# export mapping_inter="0:0;1:1,2;2:3,4;3:5;4:6"
# export mapping_head="0:0;1:1,3;2:2,4;3:5;4:6"
# export mapping_tail="0:0;1:1;2:2;3:3,5;4:4,6"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 32 to 56
# export source_model="cifar_resnet_32"
# export target_model="cifar_resnet_56"
# export mapping_inter="0:0;1:1,2;2:3,4;3:5,6;4:7,8"
# export mapping_head="0:0;1:1,5;2:2,6;3:3,7;4:4,8"
# export mapping_tail="0:0;1:1,5;2:2,6;3:3,7;4:4,8"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done

# # 44 to 14
# export source_model="cifar_resnet_44"
# export target_model="cifar_resnet_14"
# export mapping_inter="0:0;1:1"
# export mapping_head="0:0;6:1"
# export mapping_tail="0:0;1:1"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 44 to 20
# export source_model="cifar_resnet_44"
# export target_model="cifar_resnet_20"
# export mapping_inter="0:0;1:1;4:2"
# export mapping_head="0:0;5:1;6:2"
# export mapping_tail="0:0;1:1;2:2"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 44 to 32
# export source_model="cifar_resnet_44"
# export target_model="cifar_resnet_32"
# export mapping_inter="0:0;1:1;2:2;3:3;5:4"
# export mapping_head="0:0;3:1;4:2;5:3;6:4"
# export mapping_tail="0:0;1:1;2:2;3:3;4:4"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 44 to 56
# export source_model="cifar_resnet_44"
# export target_model="cifar_resnet_56"
# export mapping_inter="0:0;1:1,2;2:3,4;3:5;4:6;5:7;6:8"
# export mapping_head="0:0;1:1,3;2:2,4;3:5;4:6;5:7;6:8"
# export mapping_tail="0:0;1:1;2:2;3:3;4:4;5:5,7;6:6,8"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
#
# # 56 to 14
# export source_model="cifar_resnet_56"
# export target_model="cifar_resnet_14"
# export mapping_inter="0:0;1:1"
# export mapping_head="0:0;8:1"
# export mapping_tail="0:0;1:1"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 56 to 20
# export source_model="cifar_resnet_56"
# export target_model="cifar_resnet_20"
# export mapping_inter="0:0;1:1;5:2"
# export mapping_head="0:0;7:1;8:2"
# export mapping_tail="0:0;1:1;2:2"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 56 to 32
# export source_model="cifar_resnet_56"
# export target_model="cifar_resnet_32"
# export mapping_inter="0:0;1:1;3:2;5:3;7:4"
# export mapping_head="0:0;5:1;6:2;7:3;8:4"
# export mapping_tail="0:0;1:1;2:2;3:3;4:4"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done
# # 56 to 44
# export source_model="cifar_resnet_56"
# export target_model="cifar_resnet_44"
# export mapping_inter="0:0;1:1;2:2;3:3;4:4;5:5;7:6"
# export mapping_head="0:0;3:1;4:2;5:3;6:4;7:5;8:6"
# export mapping_tail="0:0;1:1;2:2;3:3;4:4;5:5;6:6"
# for mapping in $mapping_inter $mapping_head $mapping_tail; do
#     python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
#         --target_model_name $target_model --block_mapping "${mapping}" --levels=0-16
# done

