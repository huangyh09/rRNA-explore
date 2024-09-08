#! /bin/bash

## mapping the non-rRNA reads to the genome
DATA_DIR=/home/yuanhua/ssd/huenRNA
cd $DATA_DIR

### Alignment
# install https://github.com/alexdobin/STAR/releases/tag/2.7.11b
STARbin=/ssd/research/annotation/10x/cellranger-8.0.1/lib/bin/STAR
starRef=/ssd/research/annotation/10x/refdata-gex-GRCh38-2024-A/star

mkdir $DATA_DIR/mRNAbam

for samp in Ctrl_Mock_1 Ctrl_Mock_2 Ctrl_Mock_3 Ctrl_cx_13 Ctrl_cx_15 Ctrl_cx_16 \
Ctrl_iso_9 Ctrl_iso_10 Ctrl_iso_12 siZC3H8_1_18 siZC3H8_1_19 siZC3H8_1_21 \
siZC3H8_3_25 siZC3H8_3_26 siZC3H8_3_27 siZC3H8_4_30 siZC3H8_4_31 siZC3H8_4_32
do
    echo $samp
    
    #Make out folder
    mkdir $DATA_DIR/mRNAbam/$samp
    cd $DATA_DIR/mRNAbam/$samp
    
    #Alignment (#SortedByCoordinate)
    fastqDIR=$DATA_DIR/rRNAbam/$samp
    $STARbin --runThreadN 20 --genomeDir $starRef \
        --readFilesIn $fastqDIR/Unmapped.out.mate1 $fastqDIR/Unmapped.out.mate2 \
        --outSAMtype BAM Unsorted --quantMode GeneCounts \
        --outFilterScoreMinOverLread 0.33 --outFilterMatchNminOverLread 0.33
    
    # #Sort
    # samtools sort -@ 10 Aligned.out.bam -o Aligned.sortedByCoord.out.bam
    # samtools index Aligned.sortedByCoord.out.bam
done
