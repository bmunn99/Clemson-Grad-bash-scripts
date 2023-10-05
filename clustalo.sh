#!/bin/bash
#SBATCH --job-name=clustalo_aln
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=72:00:00
#SBATCH --mem=16G
#SBATCH --output=/data2/lackey_lab/shalam/PHYL/logs/aln.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/PHYL/logs/aln.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=shalam@g.clemson.edu
# Load software
cd /data2/lackey_lab/shalam/PHYL/three/test4
#load software
source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh
conda activate ago
# Clustalo alignment
clustalo -i AGO3_refseq_protein.fa -o AGO3_short --outfmt=clu
