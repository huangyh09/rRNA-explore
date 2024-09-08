#!/bin/bash

## align reads to rRNA sequences
# install https://github.com/alexdobin/STAR/releases/tag/2.7.11b
STARbin=/ssd/research/annotation/10x/cellranger-8.0.1/lib/bin/STAR
starRef=/ssd/research/annotation/10x/refdata-gex-GRCh38-2024-A/star

DATA_DIR=/data/users/yuanhua/huenRNA
OUT_DIR=$DATA_DIR/riboDet

mkdir $OUT_DIR

# Ctrl_Mock_2 Ctrl_Mock_3 Ctrl_cx_13 Ctrl_cx_15 Ctrl_cx_16 \
# Ctrl_iso_9 Ctrl_iso_10 Ctrl_iso_12 siZC3H8_1_18 siZC3H8_1_19 siZC3H8_1_21 \
# siZC3H8_3_25 siZC3H8_3_26 siZC3H8_3_27 siZC3H8_4_30 siZC3H8_4_31 siZC3H8_4_32
for samp in Ctrl_Mock_1 
do
    echo $samp
    
    mkdir $OUT_DIR/$samp
    cd $OUT_DIR/$samp
    
    #Remove rRNA
    fastqDIR=/ssd/users/yuanhua/huenRNA/01.RawData/$samp
    ribodetector_cpu -t 20 \
      -l 100 \
      -i $fastqDIR/"$samp"_1.fq.gz $fastqDIR/"$samp"_2.fq.gz \
      -e rrna \
      --chunk_size 256 \
      -o $OUT_DIR/$samp/reads.nonrrna.1.fq $OUT_DIR/$samp/reads.nonrrna.2.fq

    #Alignment non-rRNA/mRNA (#SortedByCoordinate)
    fastqDIR=$OUT_DIR/$samp/
    $STARbin --runThreadN 20 --genomeDir $starRef \
        --readFilesIn $fastqDIR/reads.nonrrna.1.fq $fastqDIR/reads.nonrrna.2.fq \
        --outSAMtype BAM Unsorted --quantMode GeneCounts \
        --outFilterScoreMinOverLread 0.33 --outFilterMatchNminOverLread 0.33
done
