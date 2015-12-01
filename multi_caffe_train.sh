xelu="dprelu"
init="msra"
lr="0.01"
directory="trained_models"
# solver="solver_$xelu.prototxt"

for i in 1 2 3 4 5 6 7 8 9;
do
# generating solver.prototxt
# -----------------------------
# train_val_dprelu_msra_thresh-15-part1-train
# train_val_dprelu_msra_thresh-15-part2-test
echo "train_net: \"/home/coldmoon/Desktop/job/train_val_${xelu}_${init}_thresh-15-part0${i}-train.prototxt\"" > solver.prototxt
echo "test_net: \"/home/coldmoon/Desktop/job/train_val_${xelu}_${init}_thresh-15-part-test.prototxt\"" >> solver.prototxt
echo "test_iter: 100" >> solver.prototxt
echo "test_interval: 1000" >> solver.prototxt
echo "base_lr: ${lr}" >> solver.prototxt
echo "momentum: 0.9" >> solver.prototxt
echo "weight_decay: 0.0001" >> solver.prototxt
echo "lr_policy: \"multistep\"" >> solver.prototxt
echo "gamma: 0.1" >> solver.prototxt
echo "stepvalue: 50000" >> solver.prototxt
echo "stepvalue: 100000" >> solver.prototxt
echo "display: 100" >> solver.prototxt
echo "max_iter: 120000" >> solver.prototxt
echo "snapshot: 10000" >> solver.prototxt
echo "snapshot_prefix: \"${xelu}_${init}\"" >> solver.prototxt
echo "solver_mode: GPU" >> solver.prototxt
# ------------------------------
echo 
cat solver.prototxt
echo 
echo "Training start!"

	echo "training network $i"
	mkdir $directory
	time build/tools/caffe train --solver=solver.prototxt \
	                        > nin_${xelu}_${init}_${lr}_$i.txt 2>&1
	now=$(date +"%Y%m%d_%H_%M")
	mv nin_${xelu}_${init}_${lr}_$i.txt ${directory}/nin_${xelu}_${init}_${lr}_${now}.txt
	mv ${xelu}_${init}_* ${directory}/
	mv $directory nin_${xelu}_${init}_${lr}_${now}
	echo "network $i done!";
	echo 
done
echo "Training is complete!"