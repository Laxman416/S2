import pandas as pd
import os
import argparse

def parse_arguments():
    '''
    Parses the arguments needed along the code. Arguments:
    --path      Used to specify the directory in which the root files should be written. It is not required,
                in the case it is not specified, the default path is the current working directory.
    --max_file  Used to obtain the amount files to combine
    Returns the parsed arguments.
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--path",
        type=dir_path,
        required=False,
        default=os.getcwd(),
        help="flag to set the path where the output files should be written to"
    )
    parser.add_argument(
        "--max_file",
        type=int,
        required=True,
        help="flag to set the max file"
    )
    return parser.parse_args()

def dir_path(string):
    '''
    Checks if a given string is the path to a directory.
    If affirmative, returns the string. If negative, gives an error.
    '''
    if os.path.isdir(string):
        return string
    else:
        raise NotADirectoryError(string)

args = parse_arguments() 

integer_list = []
for i in range(1, args.max_file+1, +1):
    integer_list.append(i)


# Initialize combined dataframe
combined = pd.DataFrame()
for int_value in integer_list:
    try:
        # Read the CSV file for the current integer
        current_file = pd.read_csv(f"{args.path}/Pythia/Pythia_Data/simulated_data/pythia_hadronisation{int_value}.csv")

        # Add 2mill to the event numbers in the current file
        current_file['Event '] += 2000000*(int_value-1)

        # Concatenate the current file with the existing combined dataframe
        combined = pd.concat([combined, current_file], ignore_index=True)

    except FileNotFoundError:
        print(f"File pythia_hadronisation{int_value}.csv not found.")

# Write the combined data to a new CSV file
combined.to_csv(os.path.join(f"{args.path}/Pythia/Pythia_Data", 'combined_simulated_data.csv'), index=False)