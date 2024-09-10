#!/bin/bash

## make reference for STAR (default)
# STAR --runThreadN 3 --runMode genomeGenerate \
#     --genomeDir starRef --genomeFastaFiles rRNA_5S_45S.fa \
#     --sjdbGTFfile rRNA_anno_5S_45S.gtf \
#     --sjdbOverhang 100 --genomeSAindexNbases 5


## align reads to rRNA sequences
STARbin=/ssd/users/yuanhua/envs/TFProb/bin/STAR
starRef=/ssd/users/yuanhua/huenRNA/rRNAanno/starRef
DATA_DIR=/data/users/yuanhua/huenRNA

mkdir $DATA_DIR/rRNAbam

for samp in Ctrl_Mock_1 Ctrl_Mock_2 Ctrl_Mock_3 Ctrl_cx_13 Ctrl_cx_15 Ctrl_cx_16 \
Ctrl_iso_9 Ctrl_iso_10 Ctrl_iso_12 siZC3H8_1_18 siZC3H8_1_19 siZC3H8_1_21 \
siZC3H8_3_25 siZC3H8_3_26 siZC3H8_3_27 siZC3H8_4_30 siZC3H8_4_31 siZC3H8_4_32
do
    echo $samp
    
    #Make out folder
    mkdir $DATA_DIR/rRNAbam/$samp
    cd $DATA_DIR/rRNAbam/$samp
    
    #Alignment (default: keep mate pair)
    fastqDIR=$DATA_DIR/original/01.RawData/$samp
    $STARbin --runThreadN 30 --genomeDir $starRef \
        --readFilesIn $fastqDIR/"$samp"_1.fq.gz $fastqDIR/"$samp"_2.fq.gz \
        --readFilesCommand zcat --outSAMtype BAM Unsorted --quantMode GeneCounts \
        --outFilterScoreMinOverLread 0.33 --outFilterMatchNminOverLread 0.33 \
        --outReadsUnmapped Fastx
done
