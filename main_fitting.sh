directory=$1
year=$2
size=$3
binned=$4
model=$5


mkdir $directory
# mkdir $directory"/binned_data"
# mkdir $directory"/binned_data/binning_scheme"
mkdir $directory"/model_fitting"
mkdir $directory"/model_fitting/global"
mkdir $directory"/model_fitting/local"
# mkdir $directory"/model_fitting/pT"
# mkdir $directory"/model_fitting/eta"
# for ind in {0..99}
# do
#     index=$( printf '%02d' $ind)
#     mkdir $directory"/model_fitting/local/"$index
# done
# for ind in {0..9}
# do
#     index=$( printf '%01d' $ind)
#     mkdir $directory"/model_fitting/pT/"$index
#     mkdir $directory"/model_fitting/eta/"$index
# done
# mkdir $directory"/raw_asymmetry_outcome"
# mkdir $directory"/raw_asymmetry_outcome/chi_squared"
# mkdir $directory"/raw_asymmetry_outcome/raw_asymmetry"
# mkdir $directory"/raw_asymmetry_outcome/raw_asymmetry/pT"
# mkdir $directory"/raw_asymmetry_outcome/raw_asymmetry/eta"
# mkdir $directory"/raw_asymmetry_outcome/raw_asymmetry/local"
# mkdir $directory"/results"


echo "The necessary directories have been created"
echo

# Size 10: lowest. Size 20: twice as big and includes data from Size 10

########### Model 
echo "Fitting using Model "$model
# python "Models/Model"$model"_pythonfiles/fit_global_model"$model".py"  --year $year --size $size --path $directory"/model_fitting/global" --binned_fit $binned --input "/eos/lhcb/user/l/lseelan/Total/selected_data" --scheme "total"
for meson in D0 #D0bar
do
    for polarity in  down #up
    do 
            python "Models/Model"$model"_pythonfiles/model_fitting_model"$model".py" --year $year --size $size --polarity $polarity --meson $meson --path $directory"/model_fitting/global" --input "/eos/lhcb/user/l/lseelan/Total/selected_data" --parameters_path $directory"/model_fitting/global" --scheme 'total' --binned_fit $binned
    done
done

echo "Plotted graphs"


