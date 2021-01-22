# CIFAR VGG19

# lottery_32da8a3ac7d84f9f0dda4fd60265ded3/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=16 --rewinding_steps=100it --num_workers 4

# lottery_edb979b6c106786c89409057251082ea/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19_32 --level=16 --rewinding_steps=100it --num_workers 4




### CIFAR VGG19 W32 -> W64  random split
## replicate id 118
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=16 --replicate 118 --rewinding_steps=100it --num_workers 4


### CIFAR VGG19 W32 -> W64  random split
### Also replicate the mask
## Start from level_8
## replicate id 119
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=16 --replicate 119 --rewinding_steps=100it --num_workers 4

### CIFAR VGG19 W32 -> W64  random split
### Also replicate the mask
## Start from level_11
## replicate id 120
python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=16 --replicate 120 --rewinding_steps=100it --num_workers 4

# CIFAR ResNet-14
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --level=12

python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14_32 --level=12

python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=12


### CIFAR ResNet-14 -> ResNet-20
### Also replicate the mask
## Start from level_10
## replicate id 1118
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 1118

### CIFAR ResNet-14 -> ResNet-20
### Also replicate the mask
## Start from level_6
## replicate id 2118
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 2118
