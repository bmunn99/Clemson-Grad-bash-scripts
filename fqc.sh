#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=100:00:00
#SBATCH --mem=16G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/shalam/nextseq/logs/fqc.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/nextseq/logs/fqc.%j.err
#SBATCH --mail-user=shalam@g.clemson.edu
# Load change dir
cd /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/FASTQ
ml fastqc
#load mod
for f in *combined*.fastq.gz; do
	N=$(basename $f .fastq) ;
	fastqc -t 4 --extract $f ;
done
