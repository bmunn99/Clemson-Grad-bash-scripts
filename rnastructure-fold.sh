#!/bin/bash
#
#SBATCH --job-name=fold
#SBATCH -n 20 
#SBATCH --partition=bigmem
#SBATCH --time=8:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/fold/logs/fold.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/fold/logs/fold.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=your_email

# Load the rnastructure module
module load rnastructure

# Run the Fold function
Fold /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_WT.fa ../CT/Nextseq/exp/3_WT.ct -d -mfe -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/3_WT/AGO3_WT_AGO3_WT_CDS.shape

Fold /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_E638A.fa ../CT/Nextseq/exp/E638A.ct -d -mfe -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/E638A/AGO3_E638A_AGO3_E638A_CDS.shape

Fold /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_P2.fa ../CT/Nextseq/exp/P2.ct -d -mfe -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/P2/AGO3_P2_AGO3_P2_CDS.shape

Fold /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO3_P1.fa ../CT/Nextseq/exp/P1.ct -d -mfe -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/P1/AGO3_P1_AGO3_P1_CDS.shape

Fold /data2/lackey_lab/shalam/rnastructure/shapemapper/FASTA/full/AGO2_WT.fa ../CT/Nextseq/exp/2_WT.ct -d -mfe -md 250 -sh /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/2_WT/AGO2_WT_AGO2_WT_CDS.shape
