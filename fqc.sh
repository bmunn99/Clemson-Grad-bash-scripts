#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=100:00:00
#SBATCH --mem=16G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/shalam/nextseq/logs/fqc.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/nextseq/logs/fqc.%j.err
#SBATCH --mail-user=your_email

# Change directory to the one you will pull the FASTQs from
cd /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/FASTQ

# Load the fastqc module
ml fastqc

# Run fastqc on your samples in the directory of interest
for f in *combined*.fastq.gz; do
	N=$(basename $f .fastq) ;
	fastqc -t 4 --extract $f ;
done
