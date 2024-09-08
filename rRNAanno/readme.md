# Annotation of human rRNA sequences

## Source

- RNA45SN1 (fasta downloaded from the link)
https://www.ncbi.nlm.nih.gov/gene/106631777; also link to
[NR_145819.1](https://www.ncbi.nlm.nih.gov/nuccore/NR_145819.1) RNA Sequence 

- RNA5S1 (fasta downloaded from the track to include paddings; zoom out twice)
https://www.ncbi.nlm.nih.gov/gene/100169751

## Manually generated GTF and fasta files
- rRNA GTF file: [rRNA_anno_5S_45S.gtf](./rRNA_anno_5S_45S.gtf)
- rRNA fasta file: [rRNA_5S_45S.fa](rRNA_5S_45S.fa)

## STAR's built reference

We have used STAR (version=2.7.11b) to generate the index file 
by [cmd_rRNA_align.sh](https://github.com/huangyh09/rRNA-explore/blob/main/huenRNA/analysis/_cmd_rRNA_align.sh#L4), as follow

```bash
STAR --runThreadN 3 --runMode genomeGenerate \
    --genomeDir starRef --genomeFastaFiles rRNA_5S_45S.fa \
    --sjdbGTFfile rRNA_anno_5S_45S.gtf \
    --sjdbOverhang 100 --genomeSAindexNbases 5
```
