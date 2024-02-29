seeding=$1
min_seeding=$2 # Does a loop for size in the range size to minseeding

if ! [[ "$min_seeding" =~ ^[0-9]+$ ]]; then
  echo "WARNING: You did not select a valid option for the minsize fit"
  echo
  echo "The selection will run over sizes in the array [10, ..., $min_seeding]"
  min_seeding=10
else
  echo "The selection will run over sizes in the array [$seeding,...,$min_seeding]"
fi

while [ $seeding -ge $min_seeding ]; do
    echo "Inside the loop. Seeding #: $seeding"
    ./runpythia $seeding
    seeding=$((seeding - 1))  # For example, decrease 'size' by 1 in each iteration
    git add pythia_hadronisation$seeding.csv 
    git commit -m "Commited $seeding file"
    git push origin main
done


# mkdir $directory"/pythia_hadronisation"
# mkdir $directory"/pythia_hadronisation/selected_data"
# mkdir $directory"/pythia_hadronisation/binned_data"
# mkdir $directory"/pythia_hadronisation/binned_data/binning_scheme"
# mkdir $directory"/pythia_hadronisation/binned_data/rapidity"
# mkdir $directory"/pythia_hadronisation/binned_data/pT"
# mkdir $directory"/pythia_hadronisation/binned_data/local"
# mkdir $directory"/pythia_hadronisation/results"
# mkdir $directory"/pythia_hadronisation/results/local"
# mkdir $directory"/pythia_hadronisation/results/pT"
# mkdir $directory"/pythia_hadronisation/results/rapidity"

# echo "The necessary directories have been created"
# echo

# python pythia_hadronisation/multiple_candidates_pythia.py --input $directory"/pythia_hadronisation"  --path $directory"/pythia_hadronisation/selected_data"

# echo "The phase space selection criteria has been applied and multiple candidates have been removed from the simulation data"

# python pythia_hadronisation/apply_binning_scheme_pythia.py --year $year --size $size --path $directory"/pythia_hadronisation/binned_data" --input $directory"/pythia_hadronisation/selected_data" --bin_path $directory"/pythia_hadronisation/binned_data/binning_scheme"

# echo "The simulation data has been binned"

# for scheme in local pT rapidity 
# do
#     python pythia_hadronisation/Aprod_pythia.py --path $directory"/pythia_hadronisation/results/$scheme" --input $directory"/pythia_hadronisation/binned_data/$scheme" --scheme $scheme
# done

# echo "The global and local production asymmetries have been calculated"
# echo