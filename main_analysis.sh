directory=$1
year=$2
size=$3

mkdir $directory
mkdir $directory"/binned_data"
mkdir $directory"/binned_data/binning_scheme"

# Size 10: lowest. Size 20: twice as big and includes data from Size 10

python create_binning_scheme.py --year $year --size $size --path $directory"/binned_data/binning_scheme" --input "/eos/lhcb/user/l/lseelan/Total/selected_data"

# for meson in D0 D0bar
# do 
#     for polar in up down 
#     do    
#         python apply_binning_scheme.py --year $year --size $size --meson $meson --polarity $polar --path $directory"/binned_data" --input "/eos/lhcb/user/l/lseelan/Total/selected_data" --bin_path $directory"/binned_data/binning_scheme"
#         python plot_phase_space.py --year $year --size $size --meson $meson --polarity $polar --path $directory"/binned_data/binning_scheme" --input "/eos/lhcb/user/l/lseelan/Total/selected_data" --bin_path $directory"/binned_data/binning_scheme"
#         echo "Ploted 2D graph"
#     done
# done

# echo "The data has been binned"
# echo