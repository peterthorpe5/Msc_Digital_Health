#!/bin/bash -l
#SBATCH -J fastqc   #jobname
#SBATCH -N 1     #node
#SBATCH --ntasks-per-node=1
#SBATCH -p gd5302
#SBATCH --mem=4GB

# this line takes us into the correct directory where the data is
cd /home/pjt6/scratch/digital_health/

# activate the software
export PATH=/gpfs1/scratch/bioinf/BL4273/conda/envs/genome_workshop/bin/:$PATH



# this line run fastqc on a data file.
# * is a wild card to match anything, for us R1 and R2. 
fastqc /home/pjt6/scratch/digital_health/reads/subsampled_R*.fastq.gz
echo "finished"



