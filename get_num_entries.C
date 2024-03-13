// to run code root -l -q get_num_entries.C
{
    int checkAllFiles = 1; // Set to 1 to check all files, 0 to check a specific file, 2 to run a third loop for pT and eta
    char specificFilePath[] = "/eos/lhcb/user/l/lseelan/Total/selected_data/2017/down/D0/D0_down_data_17_10_clean.root"; //individual
    int size = 10;
    char filepath[10] = "down";

    // Check specific file if flag is not set
    if (checkAllFiles == 0) {
        // Open ROOT and create a TChain
        TChain *input_tree = new TChain("D02Kpi_Tuple/DecayTree");

        // Add the file to the TChain
        input_tree->Add(specificFilePath);

        // Get the number of entries
        Long64_t nEntries = input_tree->GetEntries();

        // Display the number of entries
        printf("Number of entries in specific file: %lld\n", nEntries);

        // Clean up
        delete input_tree;
    } 
    else if (checkAllFiles == 1) {
        // Loop over file indices from 00 to 99
        int i;
        char filepath[256];
        // for (i = 0; i < 100; ++i) 
        for (i = 10; i <= 100; i += 10) 
        {
            char file_index[3];
            if (i < 10)
                sprintf(file_index, "0%d", i);
            else
                sprintf(file_index, "%d", i);

            // sprintf(filepath, "/eos/lhcb/user/l/lseelan/Total/binned_data/16/pT/both/down_16_70_bin%s.root", file_index);
            sprintf(filepath, "/eos/lhcb/user/l/lseelan/Total/selected_data/2016/down/D0/D0_down_data_16_%s_clean.root", file_index);


            // Open ROOT and create a TChain
            TChain *input_tree = new TChain("D02Kpi_Tuple/DecayTree");

            // Add the file to the TChain
            input_tree->Add(filepath);

            // Get the number of entries
            Long64_t nEntries = input_tree->GetEntries();

            // Display the number of entries
            printf("File: %s, Number of entries: %lld\n", filepath, nEntries);

            // Clean up
            delete input_tree;
        }
    }
    else if (checkAllFiles == 2) {
        // Loop over some other condition
        // Add your third loop here
        // For example, loop over indices from 0 to 9
        int i;
        char filepath[256];
        for (i = 0; i < 10; ++i) {
            char file_index[2];
            sprintf(file_index, "%d", i);

            sprintf(filepath, "/eos/lhcb/user/l/lseelan/Total/binned_data/16/eta/both/down_16_70_bin%s.root", file_index);

            // Open ROOT and create a TChain
            TChain *input_tree = new TChain("D02Kpi_Tuple/DecayTree");

            // Add the file to the TChain
            input_tree->Add(filepath);

            // Get the number of entries
            Long64_t nEntries = input_tree->GetEntries();

            // Display the number of entries
            printf("File: %s, Number of entries: %lld\n", filepath, nEntries);

            // Clean up
            delete input_tree;
        }
    }
}
