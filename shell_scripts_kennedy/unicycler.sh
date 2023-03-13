#!/bin/bash -l
#SBATCH -J unicycle   #jobname
#SBATCH -N 1     #node
#SBATCH --ntasks-per-node=2
#SBATCH -p gd5302
#SBATCH --mem=30GB

# https://github.com/rrwick/Unicycler#quick-usage
cd /home/pjt6/scratch/digital_health/

# to activate the software, paste the following in your terminal:
# activate the software
export PATH=/gpfs1/scratch/bioinf/BL4273/conda/envs/genome_workshop/bin/:$PATH
wait


unicycler -1 ./reads/ERR861370_1.fastq.gz \
    -2 ./reads/ERR861370_2.fastq.gz \
    -o unicycler -t 2 

