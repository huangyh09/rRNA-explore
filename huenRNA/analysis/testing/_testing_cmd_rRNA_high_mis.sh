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
OUT_DIR=$DATA_DIR/rRNAbam-mis

mkdir $OUT_DIR

# Ctrl_Mock_2 Ctrl_Mock_3 Ctrl_cx_13 Ctrl_cx_15 Ctrl_cx_16 \
# Ctrl_iso_9 Ctrl_iso_10 Ctrl_iso_12 siZC3H8_1_18 siZC3H8_1_19 siZC3H8_1_21 \
# siZC3H8_3_25 siZC3H8_3_26 siZC3H8_3_27 siZC3H8_4_30 siZC3H8_4_31 siZC3H8_4_32
for samp in Ctrl_Mock_1 
do
    echo $samp
    
    #Make out folder
    mkdir $OUT_DIR/$samp
    cd $OUT_DIR/$samp
    
    #Alignment (#SortedByCoordinate)
    fastqDIR=$DATA_DIR/rRNAbam/$samp
    $STARbin --runThreadN 30 --genomeDir $starRef \
        --readFilesIn $fastqDIR/Unmapped.out.mate1 $fastqDIR/Unmapped.out.mate2 \
        --outSAMtype BAM Unsorted --quantMode GeneCounts \
        --outFilterScoreMinOverLread 0.33 --outFilterMatchNminOverLread 0.33 \
        --outReadsUnmapped Fastx --outFilterMismatchNoverReadLmax 0.12
    
    # #Sort
    # samtools sort -@ 10 Aligned.out.bam -o Aligned.sortedByCoord.out.bam
    # samtools index Aligned.sortedByCoord.out.bam
done


    # #Sort
    # samtools sort -@ 10 Aligned.sortedByCoord.out.bam -o Aligned.bymate.out.bam
    # samtools index Aligned.bymate.out.bam
    
    # htseq-count -t gene --nonunique none -m intersection-strict -s no \
    #     -c htseq_count-mate.tsv Aligned.bymate.out.bam $GTF
