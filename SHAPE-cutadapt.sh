#!/bin/bash
#
#SBATCH --job-name=cutadapt
#SBATCH -n 20 
#SBATCH --partition=bigmem
#SBATCH --time=3:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/shapemapper/FASTQ/Nextseq/logs/cut.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/shapemapper/FASTQ/Nextseq/logs/cut.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=shalam@g.clemson.edu

module load cutadapt
cd /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTQ/Nextseq/combined_fastq/3_WT_modified/
# Adapter sequence
ADAPTER_SEQ="AGCGAAGTACATTGTGCGTAA"

# Get all fastq.gz files in the current directory
FILES=*.fastq.gz

for file in $FILES
do
  echo "Processing $file"
  
  # Generate output filename
  OUTPUT_FILE="${file%.fastq.gz}_trimmed.fastq.gz"

  # Run cutadapt
  cutadapt -a $ADAPTER_SEQ -o $OUTPUT_FILE $file

  echo "Done processing $file. Output has been saved to $OUTPUT_FILE"
done

# Repeat for as many folders of samples as you have
