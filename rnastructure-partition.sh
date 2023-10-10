#!/bin/bash
#
#SBATCH --job-name=partition
#SBATCH -n 20 
#SBATCH --partition=bigmem
#SBATCH --time=3:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/partition/logs/part.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/partition/logs/part.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=your_email

# Load rnastructure module
module load rnastructure

# Run the partition function
partition /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_WT.fa /data2/lackey_lab/shalam/rnastructure/partition/pfs/AGO3_WT.pfs -d -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/combined/3_WT/AGO3_WT_AGO3_WT_CDS.shape

partition /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_E638A.fa /data2/lackey_lab/shalam/rnastructure/partition/pfs/AGO3_E638A.pfs -d -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/combined/E638A/AGO3_E638A_AGO3_E638A_CDS.shape

partition /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_P2.fa /data2/lackey_lab/shalam/rnastructure/partition/pfs/AGO3_P2.pfs -d -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/combined/P2/AGO3_P2_AGO3_P2_CDS.shape

partition /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_P1.fa /data2/lackey_lab/shalam/rnastructure/partition/pfs/AGO3_P1.pfs -d -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/combined/P1/AGO3_P1_AGO3_P1_CDS.shape

partition /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO2_WT.fa /data2/lackey_lab/shalam/rnastructure/partition/pfs/AGO2_WT.pfs -d -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/combined/2_WT/AGO2_WT_AGO2_WT_CDS.shape
