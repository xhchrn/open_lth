export CUDA_VISIBLE_DEVICES=0

python open_lth.py distill --default_hparams=cifar_score-resnet_20 \
  --teacher_model_name "cifar_resnet_20" \
  --teacher_ckpt "/datadrive_c/xiaohan/open_lth_data/lottery_da8fd50859ba6d59aceca9d50ebcbf7e/replicate_1/level_0/main/model_ep0_it0.pth" \
  --teacher_mask "/datadrive_c/xiaohan/open_lth_data/lottery_da8fd50859ba6d59aceca9d50ebcbf7e/replicate_1/level_10/main/" \
  --pruning_fraction=0.89264883940700490225031008209793

python open_lth.py distill --default_hparams=cifar_score-resnet_20 \
  --teacher_model_name "cifar_resnet_20" \
  --teacher_ckpt "/datadrive_c/xiaohan/open_lth_data/lottery_da8fd50859ba6d59aceca9d50ebcbf7e/replicate_1/level_0/main/model_ep0_it0.pth" \
  --teacher_mask "/datadrive_c/xiaohan/open_lth_data/lottery_da8fd50859ba6d59aceca9d50ebcbf7e/replicate_1/level_10/main/" \
  --pruning_strategy sparse_global_orig --pruning_fraction=0.89264883940700490225031008209793

python3 open_lth.py distill \
  --model_name cifar_score-resnet_20 --model_init 'kaiming_normal' --batchnorm_init 'uniform' \
  --dataset_name cifar10 --batch_size 128 \
  --optimizer_name sgd --lr 0.1 --training_steps 160ep

python3 open_lth.py lottery \
  --model_name cifar_resnet_20 --model_init 'kaiming_normal' --batchnorm_init 'uniform' \
  --dataset_name cifar10 --batch_size 128 \
  --optimizer_name sgd --lr 0.1 --training_steps 160ep \
  --levels 16 --pruning_strategy sparse_global

python3 open_lth.py lottery \
  --model_name cifar_resnet_20_32 --model_init 'kaiming_normal' --batchnorm_init 'uniform' \
  --dataset_name cifar10 --batch_size 128 \
  --optimizer_name sgd --lr 0.1 --training_steps 160ep \
  --levels 16 --pruning_strategy sparse_global

python3 open_lth.py lottery \
  --model_name cifar_resnet_14_16 --model_init 'kaiming_normal' --batchnorm_init 'uniform' \
  --dataset_name cifar10 --batch_size 128 \
  --optimizer_name sgd --lr 0.1 --training_steps 160ep \
  --levels 16 --pruning_strategy sparse_global

python3 open_lth.py lottery \
  --model_name cifar_resnet_14_32 --model_init 'kaiming_normal' --batchnorm_init 'uniform' \
  --dataset_name cifar10 --batch_size 128 \
  --optimizer_name sgd --lr 0.1 --training_steps 160ep \
  --levels 16 --pruning_strategy sparse_global
