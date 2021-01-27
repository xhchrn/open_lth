# 14: lottery_47a5d7b2f955ca86f12cc1e70e1ce588
# 20: lottery_231c88c353aecc912eada550c58eff10
# 32: lottery_d1bce129beebea6ae76df1c61e53d1e6
# 44: lottery_9177ecc955f02f6db621dca334ce6f72
# 56: lottery_77378b9059907f2145d5a60a20b91043
python3 open_lth.py lottery_branch randomly_reinitialize --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --rewinding_steps 1000it --level=0-16 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --rewinding_steps 1000it --level=0-16 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it --level=0-16 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 --rewinding_steps 1000it --level=0-16 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --rewinding_steps 1000it --level=0-16 --replicate=$replicate

python3 open_lth.py lottery_branch randomly_prune --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --rewinding_steps 1000it --level=0-16 --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --rewinding_steps 1000it --level=0-16 --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it --level=0-16 --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 --rewinding_steps 1000it --level=0-16 --seed 7 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --rewinding_steps 1000it --level=0-16 --seed 7 --replicate=$replicate

