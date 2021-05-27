# lottery_b4705a5d67c5507773016a2bbd2440ca
python3 open_lth.py lottery --num_workers 4 --default_hparams=mnist_lenet_300_100 --model_name mnist_lenet_300_300_100         --level=16 --replicate=$replicate
# lottery_e6ed6df2d24f7195508e3b6699972146
python3 open_lth.py lottery --num_workers 4 --default_hparams=mnist_lenet_300_100 --model_name mnist_lenet_300_300_300_100     --level=16 --replicate=$replicate
# lottery_338d12765906cd84453d3c3ed830dd2b
python3 open_lth.py lottery --num_workers 4 --default_hparams=mnist_lenet_300_100 --model_name mnist_lenet_300_300_300_300_100 --level=16 --replicate=$replicate

# From mnist_lenet_300_300_300_100 -> mnist_lenet_300_300_300_300_100
export source_model="mnist_lenet_300_300_300_100"
export target_model="mnist_lenet_300_300_300_300_100"
export mapping="0:0;1:1,2;2:3"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From mnist_lenet_300_300_300_100 -> mnist_lenet_300_300_100
export source_model="mnist_lenet_300_300_300_100"
export target_model="mnist_lenet_300_300_100"
export mapping="0:0;1:1"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From mnist_lenet_300_300_100 -> mnist_lenet_300_300_300_100
export source_model="mnist_lenet_300_300_100"
export target_model="mnist_lenet_300_300_300_100"
export mapping="0:0;1:1,2"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From mnist_lenet_300_300_100 -> mnist_lenet_300_300_300_300_100
export source_model="mnist_lenet_300_300_100"
export target_model="mnist_lenet_300_300_300_300_100"
export mapping="0:0;1:1,2,3"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10


# From mnist_lenet_300_300_300_300_100 -> mnist_lenet_300_300_100
export source_model="mnist_lenet_300_300_300_300_100"
export target_model="mnist_lenet_300_300_100"
export mapping="0:0;1:1"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10

# From mnist_lenet_300_300_300_300_100 -> mnist_lenet_300_300_300_100
export source_model="mnist_lenet_300_300_300_300_100"
export target_model="mnist_lenet_300_300_300_100"
export mapping="0:0;1:1;2:2"
python3 open_lth.py lottery_branch change_depth --num_workers 4 --default_hparams=mnist_lenet_300_100 \
    --model_name        $source_model --replicate=$replicate \
    --target_model_name $target_model --block_mapping "${mapping}" --levels=10
