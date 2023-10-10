#!/bin/bash
#SBATCH --job-name=clustalo_aln
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=72:00:00
#SBATCH --mem=16G
#SBATCH --output=/data2/lackey_lab/shalam/PHYL/logs/aln.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/PHYL/logs/aln.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=your_email

# Change directory to where you'll run your alignment
cd /data2/lackey_lab/shalam/PHYL/three/test4

# Load the conda environment containing the clustalo module
# If you don't have a conda environment, make one here: https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#activating-an-environment
source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh
conda activate ago

# Clustalo alignment
clustalo -i AGO3_refseq_protein.fa -o AGO3_short --outfmt=clu
