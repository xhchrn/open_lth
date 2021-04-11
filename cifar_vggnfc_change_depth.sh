python3 open_lth.py lottery --default_hparams=cifar_vggnfc_16 --model_name cifar_vggnfc_13_64_3 --level=16 --rewinding_steps=200it --num_workers 8 --replicate=$replicate


# From cifar_vggnfc_13_64_3 -> cifar_vggnfc_13_64_5
export source_model="cifar_vggnfc_13_64_3"
export target_model="cifar_vggnfc_13_64_5"
export mapping="0:0,2;2:4,6"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From cifar_vggnfc_13_64_3 -> cifar_vggnfc_13_64_2
export source_model="cifar_vggnfc_13_64_3"
export target_model="cifar_vggnfc_13_64_2"
export mapping="0:0"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From cifar_vggnfc_13_64_2 -> cifar_vggnfc_13_64_3
export source_model="cifar_vggnfc_13_64_2"
export target_model="cifar_vggnfc_13_64_3"
export mapping="0:0,2"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_vggnfc_13_64_2 -> cifar_vggnfc_13_64_5
export source_model="cifar_vggnfc_13_64_2"
export target_model="cifar_vggnfc_13_64_5"
export mapping="0:0,2,4,6"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From cifar_vggnfc_13_64_5 -> cifar_vggnfc_13_64_2
export source_model="cifar_vggnfc_13_64_5"
export target_model="cifar_vggnfc_13_64_2"
export mapping="0:0"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From cifar_vggnfc_13_64_5 -> cifar_vggnfc_13_64_3
export source_model="cifar_vggnfc_13_64_5"
export target_model="cifar_vggnfc_13_64_3"
export mapping="0:0;2:2"
python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_vggnfc_16 \
    --model_name        $source_model --rewinding_steps 200it --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10
