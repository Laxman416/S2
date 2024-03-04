seeding=$1
min_seeding=$2 # Does a loop for size in the range size to minseeding
# Need to configure pythia folder after downloading it. Then copy pythia_hadronisation into that file

mkdir "Pythia/Pythia_Data"
mkdir "Pythia/Pythia_Data/simulated_data"


if ! [[ "$min_seeding" =~ ^[0-9]+$ ]]; then
  echo "WARNING: You did not select a valid option for the minsize fit"
  echo
  echo "The simulation will run over sizes in the array [1, ..., $min_seeding]"
  min_seeding=1
else
  echo "The selection will run over sizes in the array [$seeding,...,$min_seeding]"
fi

while [ $seeding -ge $min_seeding ]; do
    echo "Inside the loop. Seeding #: $seeding"
    Pythia/pythia_hadronisation/runpythia $seeding
    git add ./Pythia/pythia_hadronisation/simulated_data/pythia_hadronisation$seeding.csv 
    git commit -m "Commited $seeding file"
    git push origin main
    seeding=$((seeding - 1))  # For example, decrease 'size' by 1 in each iteration

done

# python Pythia/pythia_hadronisation/combining_csv.py --path '/afs/cern.ch/work/l/lseelan/Semester2' --max_file $seeding

echo "Created a csv file with all the data"
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