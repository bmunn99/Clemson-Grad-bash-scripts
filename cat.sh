#!/bin/bash

# A loop for each unique "S$" prefix
for prefix in $(ls *S*_L001_R2_*.fastq.gz | sed 's/_L001_R2_.*//'); do
    # Create a new file for each unique prefix by concatenating the R1 files with lanes L001 to L004
    zcat ${prefix}_L00{1..4}_R2_*.fastq.gz | gzip > ${prefix}_combined_R2.fastq.gz
done
[shalam@compute004 FASTQ]$ cat cat.sh 
#!/bin/bash

# A loop for each unique "S$" prefix
for prefix in $(ls *S*_L001_R1_*.fastq.gz | sed 's/_L001_R1_.*//'); do
    # Create a new file for each unique prefix by concatenating the R1 files with lanes L001 to L004
    zcat ${prefix}_L00{1..4}_R1_*.fastq.gz | gzip > ${prefix}_combined_R1.fastq.gz
done
