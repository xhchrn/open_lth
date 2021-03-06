# python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python open_lth.py lottery_branch prune_early --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_34 --levels=6 --rewinding_steps 5ep --strategy sparse_global --seed 7 --replicate=$replicate 
python open_lth.py lottery_branch prune_early --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_34 --levels=6 --rewinding_steps 5ep --strategy snip_global --seed 7 --replicate=$replicate 

