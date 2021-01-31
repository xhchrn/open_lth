python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --level=16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_16 --level=16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate


python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_16 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate


python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_16 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate

