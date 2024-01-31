# D0 production asymmetry calculator using K-pi
This project is aimed to calculating the production asymmetry of the D0 meson. This is done in differents regions of the phase space spanned by the transverse momentum and pseudorapidity of the D0 meson.

In this repository there are the necessary tools in order to:
 - Make a selection of the events given a certain criteria
 - Remove multiple candidates
 - Perform a global fit on the data using a simultaneous fit
 - Fit both using a binned approach
 - Create a uniform binning across the phase space: 3 different binning schemes
 - Perform a local fit in each of the phase space regions: (pT, eta), eta, pT
 - Process the results and output them with relevant figures

 Note that when performing the local fit some of the parameters have been fixed, using the values obtained in the global fit, in order to ensure convergence. Also note that if this program is to be used with a different set of data, the file *selection_of_events.py* will need to be modified, and other modifications may be required as well.

**Warnings:**
While running the code be aware that any change to one of the scripts can lead to a malfunction. In addition, make sure that the directories that will be generated while running the program don't already exist. If they do exist beforehand, this program might not work as intended.

## How to download
In order to download this package you can use the following commands in your terminal:
```
mkdir ProductionAsymmetry
cd ProductionAsymmetry
git init
git remote add -f origin *****************
git pull origin master
```
## How to use
The different scripts can be run individually (note that a different set of arguments is required for each), or as a whole using the bash script *main.sh*.
In order to use *main.sh* 3 arguments are required. These are:
- The path where the output should be written
- The size or amount of data to be used [range(0,800) and divisible by 10]
- Whether a binned fit should be performed (otherwise unbinned fit) [y, Y, n, N]

The range is divisible by 10 so when performing the fit, the desired root files can be achieved via a loop. An input of 20 will allow the fit to add the root files of 20 and 10 to the TChain.

Here is an example of how to call *main.sh*:
```
bash main.sh example 10 y
```

## Credits
A large amount of the scripts uses or is inspired by the code written by Camille Jarvis-Stiggants and Michael England during their MPhys project and Marc Oriol Pérez in his summer internship.


**Author:** Laxman Seelan (laxman.seelan@student.manchester.ac.uk) and Sam Taylor / **Last modified:** 31st January 2024