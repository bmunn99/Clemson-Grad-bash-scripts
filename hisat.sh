#!/bin/bash
#SBATCH --job-name=P2_male_hisat
#SBATCH -n 16
#SBATCH --partition=compute
#SBATCH --time=100:00:00
#SBATCH --mem=32G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/shalam/nextseq/logs/hisat.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/nextseq/logs/hisat.%j.err
#SBATCH --mail-user=your_email

# Change dir
cd /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/bam/P2_male

# Load your modules
module load hisat2/2.1.0
module load samtools/1.10
module load regtools/0.5.0

# Run hisat2 to generate sam files
hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-1_S3_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-1_S3_combined_clean_R2.fastq.gz -S P2C-1-1.sam

hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-2_S4_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-2_S4_combined_clean_R2.fastq.gz -S P2C-1-2.sam

hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-3_S5_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-1-3_S5_combined_clean_R2.fastq.gz -S P2C-1-3.sam

hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-1_S6_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-1_S6_combined_clean_R2.fastq.gz -S P2C-2-1.sam

hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-2_S7_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-2_S7_combined_clean_R2.fastq.gz -S P2C-2-2.sam

hisat2 -p 24 --qc-filter -x /data2/lackey_lab/GenomeReferences/hisat_index/hisat_index -1 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-3_S8_combined_clean_R1.fastq.gz -2 /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/P2_male/P2C-2-3_S8_combined_clean_R2.fastq.gz -S P2C-2-3.sam

# Convert sam to bam
for B in *.sam; do
  N=$(basename $B .sam) ;
  samtools view --threads 16 -bS $B | samtools sort -O BAM -o $N.bam ;
done
# Convert bam to junc files
for B in *.bam; do
  N=$(basename $B .bam) ;
  samtools index $B ;
  regtools junctions extract -s 0 -a 8 -m 50 -M 500000 $B -o $N.junc ;
done

# Unload your modules
module unload samtools
module unload hisat2
module unload regtools
