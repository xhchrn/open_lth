# 44 to 44 -- shuffle 1/2/3 pair
export source_model="cifar_resnet_44"
export target_model="cifar_resnet_44"
export mapping_1pair="0:0;1:6;2:2;3:3;4:4;5:5;6:1"
export mapping_2pair="0:0;1:6;2:5;3:3;4:4;5:2;6:1"
export mapping_3pair="0:0;1:6;2:5;3:4;4:3;5:2;6:1"
for mapping in $mapping_1pair $mapping_2pair $mapping_3pair; do
	python3 open_lth.py lottery_branch change_depth --num_workers 8 --default_hparams=cifar_resnet_20 --model_name $source_model --rewinding_steps 1000it --replicate=$replicate \
	    --target_model_name $target_model --block_mapping "${mapping}" --levels=10
done