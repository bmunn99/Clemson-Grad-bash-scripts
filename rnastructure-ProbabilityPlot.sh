#!/bin/bash
#
#SBATCH --job-name=prob_plot
#SBATCH -n 20 
#SBATCH --partition=bigmem
#SBATCH --time=3:00:00
#SBATCH --mem=100gb
#SBATCH --output=/data2/lackey_lab/shalam/rnastructure/partition/logs/prob.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/rnastructure/partition/logs/prob.%j.err
#SBATCH --mail-type=all
#SBATCH --mail-user=your_email

# Load the rnastructure module
module load rnastructure

# Run the ProbabilityPlot function to generate dot plots
ProbabilityPlot ../pfs/AGO3_WT.pfs ../dp/AGO3_WT.dp -t

ProbabilityPlot ../pfs/AGO3_E638A.pfs ../dp/AGO3_E638A.dp -t

ProbabilityPlot ../pfs/AGO3_P2.pfs ../dp/AGO3_P2.dp -t

ProbabilityPlot ../pfs/AGO3_P1.pfs ../dp/AGO3_P1.dp -t

ProbabilityPlot ../pfs/AGO2_WT.pfs ../dp/AGO2_WT.dp -t
