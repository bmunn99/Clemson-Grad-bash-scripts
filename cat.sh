#!/bin/bash
# This script loops through each FASTQ.gz file and concatenates all the lanes for Read 1 (R1) and for Read 2 (R2)

# R1
# A loop for each unique "S$" prefix
for prefix in $(ls *S*_L001_R1_*.fastq.gz | sed 's/_L001_R1_.*//'); do
    # Create a new file for each unique prefix by concatenating the R1 files with lanes L001 to L004
    zcat ${prefix}_L00{1..4}_R1_*.fastq.gz | gzip > ${prefix}_combined_R1.fastq.gz
done

# R2
# A loop for each unique "S$" prefix
for prefix in $(ls *S*_L001_R2_*.fastq.gz | sed 's/_L001_R2_.*//'); do
    # Create a new file for each unique prefix by concatenating the R1 files with lanes L001 to L004
    zcat ${prefix}_L00{1..4}_R2_*.fastq.gz | gzip > ${prefix}_combined_R2.fastq.gz
done
