#!/bin/bash
#$ -V ## pass all environment variables to the job, VERY IMPORTANT
#$ -N pipeline ## job name
#$ -S /bin/bash ## shell where it will run this job
#$ -j y ## join error output to normal output
#$ -cwd ## Execute the job from the current working directory
#$ -m e
#$ -M ${USER}@st-andrews.ac.uk


cp -rv /shelf/Computational_Genomics/Msc_Digital_Health/ ~/
wait

cd $HOME/Msc_Digital_Health/

# set up some variables
kmer=127
threads=6
trim_path=/shelf/training/Trimmomatic-0.38/

. /shelf/apps/pjt6/conda/etc/profile.d/conda.sh 


echo "loading required modules"
module load FASTQC
# load the velvet module
module load velvet/gitv0_9adf09f



# do assemblies over a whole range of kmers, odd numbers only:
# you should only assemble with odd kmer due to palindromes. 
# for kmer in {55..127} # this will take too long 19 hours!
for kmer in {55..127}
do
    rem=$(($kmer % 2))
    if [ "$rem" -ne "0" ]; then
        echo $kmer
        velveth_trim_cmd="velveth unknown_trimmed_${kmer} ${kmer} -shortPaired 
        -fastq $HOME/Msc_Digital_Health/subsampled_R1_paired.fastq.gz 
        $HOME/Msc_Digital_Health/subsampled_R1_paired.fastq.gz"
        velveg_assembl="velvetg unknown_trimmed_${kmer}"
        echo ${velveth_trim_cmd}
        eval ${velveth_trim_cmd}
        echo ${velveg_assembl}
        eval ${velveg_assembl}
    fi
done


# assembly stats
stats="perl $HOME/Msc_Digital_Health/shell_scripts/scaffold_stats.pl 
     -f ./unknown*/contigs.fa 
     > all_contig_len.stats.txt"
echo ${stats}
eval ${stats}
