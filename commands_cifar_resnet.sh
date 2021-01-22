# CIFAR ResNet-18

# lottery_7167d1ec522e756c5fadb0da1052c04e/replicate_1/level_0/main
python3 open_lth.py lottery --num_workers 8 \
    --default_hparams=cifar_resnet_20 \
    --model_name imagenet_resnet_18 \
    --training_steps 182ep --milestone_steps 91ep,136ep \
    --batch_size 256 --weight_decay 2e-4 \
    --rewinding_steps 9ep --level=16 


# lottery_c0f5740ae10d1e946d25aa0f1172825f/replicate_1/level_0/main
python3 open_lth.py lottery --num_workers 16 \
    --default_hparams=cifar_resnet_20 \
    --model_name imagenet_resnet_34 \
    --training_steps 182ep --milestone_steps 91ep,136ep \
    --batch_size 256 --weight_decay 2e-4 \
    --rewinding_steps 9ep --level=16 


python3 open_lth.py train --num_workers 8 \
    --default_hparams=cifar_resnet_20 \
    --model_name imagenet_resnet_18 \
    --training_steps 182ep --milestone_steps 91ep,136ep \
    --batch_size 256 --weight_decay 2e-4




# # lottery_b7773335d251f26316a88e7effb19da8/replicate_1/level_0/main
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12

# # lottery_23b644efaef60c49ca88fc5e37e2595a/replicate_1/level_0/main
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --rewinding_steps=500it

# # lottery_e83cd7fb6f734bac485b58acd238bb22/replicate_1/level_0/main
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12  --rewinding_steps=500it


# for rw_step in 300 400 600 700 800 900 1000 1100 1200 1300 1400 1500; do
#     python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --rewinding_steps="${rw_step}it"
# done

# for rw_step in 300 400 600 700 800 900 1000 1100 1200 1300 1400 1500; do
#     python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps="${rw_step}it"
# done

# ################################################################################
# ################################################################################

# ### CIFAR ResNet-20  W16 -> W32  random split
# ## replicate id 118
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 118

# ### CIFAR ResNet-20  W16 -> W32  random split 
# ### Also replicate the mask
# ## Start from level_10
# ## replicate id 218
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 218

# ### CIFAR ResNet-20  W16 -> W32  random split 
# ### Also replicate the mask
# ## Start from level_6
# ## replicate id 318
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --replicate 318


# ################################################################################
# ################################################################################

# ### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
# ## replicate id 118
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 118 --num_workers 4

# ### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
# ### Also replicate the mask
# ## Start from level_6
# ## replicate id 119
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 119 --num_workers 4

# ### CIFAR ResNet-20  W16 -> W32 - rewind - random split 
# ### Also replicate the mask
# ## Start from level_10
# ## replicate id 120
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_20_32 --level=12 --rewinding_steps=500it --replicate 120 --num_workers 4


# ################################################################################
# ################################################################################


# ### CIFAR ResNet-20  W32 -> W16 take subnetwork
# ## replicate id 618
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 618 --num_workers 4

# ### CIFAR ResNet-20  W32 -> W16 take subnetwork
# ### Also take submask
# ## Start from level_6
# ## replicate id 619
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 619 --num_workers 4

# ### CIFAR ResNet-20  W32 -> W16 take subnetwork
# ### Also take submask
# ## Start from level_10
# ## replicate id 620
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 620 --num_workers 4


# ################################################################################
# ################################################################################


# # CIFAR ResNet-14
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14 --level=12

# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --model_name cifar_resnet_14_32 --level=12

# python3 open_lth.py lottery --default_hparams=cifar_vgg_16 --model_name cifar_vgg_19 --level=12


# ### CIFAR ResNet-14 -> ResNet-20
# ### Also replicate the mask
# ## Start from level_10
# ## replicate id 1118
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 1118

# ### CIFAR ResNet-14 -> ResNet-20
# ### Also replicate the mask
# ## Start from level_6
# ## replicate id 2118
# python3 open_lth.py lottery --default_hparams=cifar_resnet_20 --level=12 --replicate 2118
