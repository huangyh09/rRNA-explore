#!/bin/bash

## align reads to rRNA sequences
GTF=/home/yuanhua/MyGit/rRNA-explore/rRNAanno/rRNA_anno_5S_45S.gtf

DATA_DIR=/data/users/yuanhua/huenRNA
OUT_DIR=$DATA_DIR/rRNAbam


for samp in Ctrl_Mock_1 Ctrl_Mock_2 Ctrl_Mock_3 Ctrl_cx_13 Ctrl_cx_15 Ctrl_cx_16 \
Ctrl_iso_9 Ctrl_iso_10 Ctrl_iso_12 siZC3H8_1_18 siZC3H8_1_19 siZC3H8_1_21 \
siZC3H8_3_25 siZC3H8_3_26 siZC3H8_3_27 siZC3H8_4_30 siZC3H8_4_31 siZC3H8_4_32
do
    echo $samp
    cd $OUT_DIR/$samp

    htseq-count -t gene --nonunique none -m intersection-strict -s no \
        -c htseq_count.tsv Aligned.sortedByCoord.out.bam $GTF #&
done
