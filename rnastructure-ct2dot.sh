#!/bin/bash
#
#SBATCH --job-name=ct2dot
#SBATCH -n 20 
#SBATCH --partition=bigmem
#SBATCH --time=3:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/ct2dot/logs/ct2dot.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/ct2dot/logs/ct2dot.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=shalam@g.clemson.edu

module load rnastructure
ct2dot /data2/lackey_lab/shalam/rnastructure/fold/CT/Nextseq/3_WT.ct 1 ../dot/Nextseq/3_WT.dot
ct2dot /data2/lackey_lab/shalam/rnastructure/fold/CT/Nextseq/E638A.ct 1 ../dot/Nextseq/E638A.dot
ct2dot /data2/lackey_lab/shalam/rnastructure/fold/CT/Nextseq/P2.ct 1 ../dot/Nextseq/P2.dot
ct2dot /data2/lackey_lab/shalam/rnastructure/fold/CT/Nextseq/P1.ct 1 ../dot/Nextseq/P1.dot
ct2dot /data2/lackey_lab/shalam/rnastructure/fold/CT/Nextseq/2_WT.ct 1 ../dot/Nextseq/2_WT.dot
