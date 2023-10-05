#!/bin/bash
#SBATCH --job-name=iqtree
#SBATCH -n 4
#SBATCH --partition=compute
#SBATCH --time=72:00:00
#SBATCH --mem=16G
#SBATCH --output=/data2/lackey_lab/shalam/PHYL/logs/tree.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/PHYL/logs/tree.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=shalam@g.clemson.edu
# Load software
cd /data2/lackey_lab/shalam/PHYL/three/test4
#load software
source /opt/ohpc/pub/Software/anaconda3/etc/profile.d/conda.sh
conda activate ago
#iqtree
iqtree -s AGO3_short.aln -nt 4 -pre AGO3_iqtree
