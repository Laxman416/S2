{
// run using root -l -q DrawPlotVariables.C
int year = 16;
int size = 10;
char filepath[256];
char foldername[256];
sprintf(foldername, "Graphs_%d_%d", size, year);

gSystem->mkdir(foldername, kTRUE); // Create directory if it doesn't exist


sprintf(filepath, "/eos/lhcb/user/l/lseelan/Total/selected_data/20%d/down/D0/D0_down_data_%d_%d_clean.root", year, year, size);

TChain *input_tree = new TChain("D02Kpi_Tuple/DecayTree");

input_tree->Add(filepath);

TCanvas *c1 = new TCanvas("c1", "Canvas", 800, 600);

input_tree->Draw("D0_MM");
c1->SaveAs(Form("%s/D0_MM_%d_%d.png", foldername, year, size));

input_tree->Draw("P1_PT");
c1->SaveAs(Form("%s/P1_PT_%d_%d.png", foldername, year, size));

input_tree->Draw("P2_PT");
c1->SaveAs(Form("%s/P2_PT_%d_%d.png", foldername, year, size));

input_tree->Draw("P1_ETA");
c1->SaveAs(Form("%s/P1_ETA_%d_%d.png", foldername, year, size));

input_tree->Draw("D0_ETA");
c1->SaveAs(Form("%s/D0_ETA_%d_%d.png", foldername, year, size));

input_tree->Draw("D0_PT");
c1->SaveAs(Form("%s/D0_PT_%d_%d.png", foldername, year, size));
}