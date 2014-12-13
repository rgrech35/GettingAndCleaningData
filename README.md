# Getting and Cleaning Data Course Project

This is the readme file for the Getting and Cleaning Data Course Project on Coursera, offered through Johns Hopkins University.

##Installation
Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract it to a directory called "UCI HAR Dataset"

##Package Dependencies
The script run_analysis.R requires the ```dplyr``` package. The script does not check for or install this package. If you do not have this package installed, you must install it prior to running the script.

##Running The Script
1. Change the R working directory to the "UCI HAR Dataset" directory.
2. Run the script ```run_analysis.R``` in R by running the ```source("run_analysis.R")``` command.
3. File ```tidy.csv``` will be output to the "UCI HAR Dataset" directory.

##Codebook
A codebook can be found in ```codebook.md```

##Script Documentation
The script itself contains comments which describe how the script works.