# SWAT-output-file-read-by-R

You can only run here "output.sub" with this script.
Before run this script you need to do some steps.

1. Copy your "InputOutput" file from SWAT Scenario to another folder (suppose this folder name is 'simulation'.
2. Copy SWAT system file on that folder ('simulation'). (you can find that which drive you install SWAT)
3. Change directory from R to 'simulation'and set up as a working directory.
4. Be carefull on no of subbasins, I have 65 subbasins, so I use 'tail, 65'. Change this no as your number of subbasins. 
   Otherwise script does give wrong results.
5. Run the script by selecting all function together. 
6. See the results.
