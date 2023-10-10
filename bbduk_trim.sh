#!/bin/bash
#SBATCH --job-name=bbduk2
#SBATCH -n 8
#SBATCH --partition=compute
#SBATCH --time=100:00:00
#SBATCH --mem=32G
#SBATCH --mail-type=all
#SBATCH --output=/data2/lackey_lab/shalam/nextseq/logs/bbduk.%j.out
#SBATCH --error=/data2/lackey_lab/shalam/nextseq/logs/bbduk.%j.err
#SBATCH --mail-user=your_email

# Change directory to where your combined FASTQs are located
cd /data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/FASTQ/combined

# Load the java_jdk and bbmap modules
module load java_jdk/11.0.2
module load bbmap/38.73

# For each read pair of FASTQ.gz files, trim off the rRNA and adapter sequences
for i in `ls -1 *_R1.fastq.gz | sed 's/_R1.fastq.gz//'`
do
bbduk.sh -Xmx32g in1=${i}_R1.fastq.gz in2=${i}_R2.fastq.gz out1=/data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/${i}_clean_R1.fastq.gz out2=/data2/lackey_lab/shalam/nextseq/Sept08_23_NextSeq_gBlock_AGO3/clean/${i}_clean_R2.fastq.gz ref=/data2/databases/rrna_silva/ribokmers.fa,/data2/lackey_lab/shalam/nova/SF3B1_042523/raw/adapters.fa tbo tpe ktrim=r k=31 hdist=1 qtrim=rl trimq=15 minlength=20 maxns=1 threads=auto
done
