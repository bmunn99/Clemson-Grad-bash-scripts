#!/bin/bash
#SBATCH --job-name=iqtree
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=72:00:00
#SBATCH --mem=16G
#SBATCH --output=/data2/lackey_lab/shalam/PHYL/logs/tree.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/PHYL/logs/tree.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=your_email

# Change directory to one you will be working in
cd /data2/lackey_lab/shalam/PHYL/three/test4

# Load conda environment containing iqtree
# If you don't have a conda environment, make one here: https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#activating-an-environment
source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh
conda activate ago

# Run iqtree
iqtree -s AGO3_short.aln -nt 4 -pre AGO3_iqtree
