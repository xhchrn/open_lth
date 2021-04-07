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

python3 open_lth.py train --default_hparams=cifarhe_resnet_18 --model_name cifarhe_resnet_18 --ar 1e-3 --tau 1e-6 --ar_decay_ratio 0.1 --ar_decay_freq 50 --optimizer bop --num_workers 4 --replicate 42
