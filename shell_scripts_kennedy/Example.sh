#!/bin/bash -l
#SBATCH -J example   #jobname
#SBATCH -N 1     #node
#SBATCH --ntasks-per-node=1
#SBATCH -p bl4237
#SBATCH --mem=1GB

cd /home/pjt6/scratch/digital_health/
echo "I am running the script"
echo "tell me someting good"



