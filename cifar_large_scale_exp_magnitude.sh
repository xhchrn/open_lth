python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch prune_early --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --rewinding_steps 1000it --level=0-16 --strategy sparse_global --seed 7 --replicate=$replicate

