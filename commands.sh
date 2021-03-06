# CIFAR ResNet-20

# lottery_93bc65d66dfa64ffaf2a0ab105433a2c/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12

# lottery_b7773335d251f26316a88e7effb19da8/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12

# lottery_23b644efaef60c49ca88fc5e37e2595a/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --rewinding_steps=500it

# lottery_47a5d7b2f955ca86f12cc1e70e1ce588
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --level=12 --rewinding_steps=1000it

# lottery_e83cd7fb6f734bac485b58acd238bb22/replicate_1/level_0/main
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12  --rewinding_steps=500it

# lottery_d1bce129beebea6ae76df1c61e53d1e6
python3 open_lth.py lottery --num_workers 4 \
  --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 \
  --rewinding_steps 1000it --level=12

python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=cifar_resnet_20 --model_name cifar_resnet_32 --rewinding_steps 1000it \
    --target_model_name cifar_resnet44 --block_mapping "0:0;1:1,2;2:3,4;3:5;4:6" --levels=10


# lottery_9177ecc955f02f6db621dca334ce6f72
python3 open_lth.py lottery --num_workers 4 \
  --default_hparams=cifar_resnet_20 --model_name cifar_resnet_44 \
  --rewinding_steps 1000it --level=12

# lottery_77378b9059907f2145d5a60a20b91043
python3 open_lth.py lottery --num_workers 4 \
  --default_hparams=cifar_resnet_20 --model_name cifar_resnet_56 \
  --rewinding_steps 1000it --level=12


for rw_step in 300 400 600 700 800 900 1000 1100 1200 1300 1400 1500; do
    python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --rewinding_steps="${rw_step}it"
done

for rw_step in 300 400 600 700 800 900 1000 1100 1200 1300 1400 1500; do
    python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps="${rw_step}it"
done

################################################################################
################################################################################

### CIFAR ResNet-20  W16 -> W32  random split
## replicate id 118
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 118

### CIFAR ResNet-20  W16 -> W32  random split 
### Also replicate the mask
## Start from level_10
## replicate id 218
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 218

### CIFAR ResNet-20  W16 -> W32  random split 
### Also replicate the mask
## Start from level_6
## replicate id 318
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 318


################################################################################
################################################################################

### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
## replicate id 118
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 118 --num_workers 4

### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
### Also replicate the mask
## Start from level_6
## replicate id 119
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 119 --num_workers 4

### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
### Also replicate the mask
## Start from level_10
## replicate id 120
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 120 --num_workers 4


################################################################################
################################################################################


### CIFAR ResNet-20  W32 -> W16 take subnetwork
## replicate id 618
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 618 --num_workers 4

### CIFAR ResNet-20  W32 -> W16 take subnetwork
### Also take submask
## Start from level_6
## replicate id 619
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 619 --num_workers 4

### CIFAR ResNet-20  W32 -> W16 take subnetwork
### Also take submask
## Start from level_10
## replicate id 620
python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 620 --num_workers 4


################################################################################
################################################################################


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
