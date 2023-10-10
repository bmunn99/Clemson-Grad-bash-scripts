#!/bin/bash
#SBATCH --job-name=P2_ctrls_featcounts
#SBATCH -n 16
#SBATCH --partition=compute
#SBATCH --time=168:00:00
#SBATCH --mem=20G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/shalam/nextseq/logs/featcounts.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/nextseq/logs/featcounts.%j.err
#SBATCH --mail-user=your_email

# Change directory to where you'll access the bam files
cd /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/bam/P2_male

# Load the subread module
module add subread/1.6.4

# Run featureCounts
featureCounts -T 2 -t transcript -p -s 2 -g gene_id -Q 30 -F GTF -a /data2/lackey_lab/GenomeReferences/hisat_index/gencode.v39.annotation.gtf  -o P2_three_ctrls_transcript.txt *.bam
