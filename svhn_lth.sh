# 14:
# 20:
# 32:
# 44:
# 56:
python3 open_lth.py lottery --num_workers 8 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --dataset_name svhn --rewinding_steps 1000it --level=16 --replicate=$replicate
python3 open_lth.py lottery --num_workers 8 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20 --dataset_name svhn --rewinding_steps 1000it --level=16 --replicate=$replicate
python3 open_lth.py lottery --num_workers 8 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --dataset_name svhn --rewinding_steps 1000it --level=16 --replicate=$replicate
python3 open_lth.py lottery --num_workers 8 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 --dataset_name svhn --rewinding_steps 1000it --level=16 --replicate=$replicate
python3 open_lth.py lottery --num_workers 8 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 --dataset_name svhn --rewinding_steps 1000it --level=16 --replicate=$replicate

