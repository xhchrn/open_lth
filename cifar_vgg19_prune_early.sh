python open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --rewinding_steps 200it --levels=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --rewinding_steps 200it --levels=0-16 --strategy snip_global --seed 7 --replicate=$replicate 
