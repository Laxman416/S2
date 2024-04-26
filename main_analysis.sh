directory=$1
year=$2
size=$3

mkdir $directory"/asymmetry/"
mkdir $directory"/asymmetry/pT"
mkdir $directory"/asymmetry/eta"
mkdir $directory"/asymmetry/local"
mkdir $directory"/results"

echo "Plotting eta and pT graphs"
echo
python plot_pT_eta.py --year $year --size $size --bin_path $directory"/binned_data/binning_scheme" --asymm_path $directory"/asymmetry/pT" --path $directory"/results" --scheme 'pT' --sim_asymm_path $directory"/Pythia/asymmetry/pT"
echo
echo "ploted pT"
echo
# python plot_pT_eta.py --year $year --size $size --bin_path $directory"/binned_data/binning_scheme" --asymm_path $directory"/asymmetry/eta" --path $directory"/results" --scheme 'eta' --sim_asymm_path $directory"/Pythia/asymmetry/eta"

echo "pT and eta plotted graph"
