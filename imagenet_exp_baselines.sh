python open_lth.py lottery_branch randomly_reinitialize --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate
python open_lth.py lottery_branch randomly_prune --seed 7 --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_18 --levels=6 --rewinding_steps 5ep --replicate=$replicate

# python open_lth.py lottery_branch randomly_reinitialize --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_26 --levels=6 --rewinding_steps 5ep --replicate=$replicate
# python open_lth.py lottery_branch randomly_prune --seed 7 --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_26 --levels=6 --rewinding_steps 5ep --replicate=$replicate

python open_lth.py lottery_branch randomly_reinitialize --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_34 --levels=6 --rewinding_steps 5ep --replicate=$replicate
python open_lth.py lottery_branch randomly_prune --seed 7 --num_workers 16 --default_hparams=imagenet_resnet_50 --model_name imagenet_resnet_34 --levels=6 --rewinding_steps 5ep --replicate=$replicate

