#!/bin/bash
#SBATCH -J lth_resnet18
#SBATCH -o jobs/lth_resnet18.o
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -p gtx
#SBATCH -t 24:00:00
#SBATCH -A Senior-Design_UT-ECE
#SBATCH --mail-user=jzhang27143@gmail.com
#SBATCH --mail-type=end

python3 open_lth.py lottery --default_hparams=cifarhe_resnet_18 --model_name cifarhe_resnet_18 --level=16 --rewinding_steps=1000it --num_workers 4 --replicate=42

python3 open_lth.py lottery --default_hparams=cifarhe_resnet_18 --model_name cifarhe_resnet_18 --level=16 --rewinding_steps=1000it --num_workers 4 --replicate=42

python open_lth.py lottery --num_workers 4 \
    --default_hparams=imagenet_resnet_50 \
    --model_name imagenet_resnet_18 \
    --milestone_steps '80ep,120ep' --training_steps '160ep' --warmup_steps '1ep' \
    --dataset_name cifar10_im --batch_size 128 \
    --levels=6 --rewinding_steps 5ep --replicate=$replicate

python open_lth.py lottery --num_workers 4 \
    --default_hparams=imagenet_resnet_50 \
    --model_name imagenet_resnet_26 \
    --milestone_steps '80ep,120ep' --training_steps '160ep' --warmup_steps '1ep' \
    --dataset_name cifar10_im --batch_size 128 \
    --levels=6 --rewinding_steps 5ep --replicate=$replicate

python open_lth.py lottery --num_workers 4 \
    --default_hparams=imagenet_resnet_50 \
    --model_name imagenet_resnet_34 \
    --milestone_steps '80ep,120ep' --training_steps '160ep' --warmup_steps '1ep' \
    --dataset_name cifar10_im --batch_size 128 \
    --levels=6 --rewinding_steps 5ep --replicate=$replicate
