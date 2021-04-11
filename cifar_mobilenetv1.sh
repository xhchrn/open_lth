python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_3 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_5 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_10 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate


# From cifar_mobilenetv1_5 -> cifar_mobilenetv1_10
export source_model="cifar_mobilenetv1_5"
export target_model="cifar_mobilenetv1_10"
export mapping="0:0,1;1:2,3;2:4,5;3:6,7;4:8,9"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_mobilenetv1_5 -> cifar_mobilenetv1_3
export source_model="cifar_mobilenetv1_5"
export target_model="cifar_mobilenetv1_3"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_mobilenetv1_3 -> cifar_mobilenetv1_5
export source_model="cifar_mobilenetv1_3"
export target_model="cifar_mobilenetv1_5"
export mapping="0:0;1:1,2;2:3,4"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_mobilenetv1_3 -> cifar_mobilenetv1_10
export source_model="cifar_mobilenetv1_3"
export target_model="cifar_mobilenetv1_10"
export mapping="0:0,1,2,3;1:4,5,6;2:7,8,9"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_mobilenetv1_10 -> cifar_mobilenetv1_3
export source_model="cifar_mobilenetv1_10"
export target_model="cifar_mobilenetv1_3"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_mobilenetv1_10 -> cifar_mobilenetv1_5
export source_model="cifar_mobilenetv1_10"
export target_model="cifar_mobilenetv1_5"
export mapping="0:0;1:1;2:2;3:3;4:4"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_mobilenetv1 \
    --model_name        $source_model --rewinding_steps 1000it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10
