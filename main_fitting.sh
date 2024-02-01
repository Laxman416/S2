directory=$1
size=$2
binned=$3
# Size 10: lowest. Size 20: twice as big and includes data from Size 10

python fit_global.py  --size $size --path $directory"/model_fitting/global" --binned_fit $binned --input $directory"/selected_data" --scheme "total"
# for meson in D0 D0bar
# do 
#     python model_fitting.py --size $size --meson $meson --path $directory"/model_fitting/global" --input $directory"/selected_data" --parameters_path $directory"/model_fitting/global" --scheme 'total' --binned_fit $binned
# done