python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_3 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_5 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate
python3 open_lth.py lottery --default_hparams=cifar_mobilenetv1 --model_name cifar_mobilenetv1_10 --level=10 --rewinding_steps=1000it --num_workers 8 --replicate=$replicate


python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_16 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_reinitialize --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate


python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_13 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_16 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate
python3 open_lth.py lottery_branch randomly_prune --seed 7 --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=0-16 --rewinding_steps=200it --num_workers 4 --replicate=$replicate

python3 open_lth.py lottery --default_hparams=cifar_vggnfc_16 --model_name cifar_vggnfc_13_64_3 --level=12 --rewinding_steps=200it --num_workers 8 --replicate=$replicate

