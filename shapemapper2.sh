#!/bin/bash
#
#SBATCH --job-name=shape
#SBATCH -n 20
#SBATCH --partition=bigmem
#SBATCH --time=3:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/shapemapper/logs/shape.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/shapemapper/logs/shape.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=shalam@g.clemson.edu

module load shapemapper/2.1.5

# Run shapemapper
shapemapper --name AGO3_WT --target ../FASTA/full/AGO3_WT.fa --out /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/3_WT/ --modified --folder ../FASTQ/Nextseq/combined_fastq/3_WT_modified --untreated --folder ../FASTQ/Nextseq/combined_fastq/3_WT_untreated --random-primer-len 21 --min-depth 1000 --overwrite

shapemapper --name AGO3_E638A --target ../FASTA/full/AGO3_E638A.fa --out /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/E638A/ --modified --folder ../FASTQ/Nextseq/combined_fastq/E638A_modified --untreated --folder ../FASTQ/Nextseq/combined_fastq/E638A_untreated --random-primer-len 21 --min-depth 1000 --overwrite

shapemapper --name AGO3_P2 --target ../FASTA/full/AGO3_P2.fa --out /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/P2/ --modified --folder ../FASTQ/Nextseq/combined_fastq/P2_modified --untreated --folder ../FASTQ/Nextseq/combined_fastq/P2_untreated --random-primer-len 21 --min-depth 1000 --overwrite

shapemapper --name AGO3_P1 --target ../FASTA/full/AGO3_P1.fa --out /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/P1/ --modified --folder ../FASTQ/Nextseq/combined_fastq/P1_modified --untreated --folder ../FASTQ/Nextseq/combined_fastq/P1_untreated --random-primer-len 21 --min-depth 1000 --overwrite

shapemapper --name AGO2_WT --target ../FASTA/full/AGO2_WT.fa --out /data2/lackey_lab/shalam/rnastructure/shapemapper/AGO3_results/Nextseq/2_WT/ --modified --folder ../FASTQ/Nextseq/combined_fastq/2_WT_modified --untreated --folder ../FASTQ/Nextseq/combined_fastq/2_WT_untreated --random-primer-len 21 --min-depth 1000 --overwrite

module unload shapemapper/2.1.5
