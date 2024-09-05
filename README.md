# rRNA-explore
Exploratory note for ribosomal RNA analysis from RNA-Seq

Note, it's for the genes of [ribosomal RNA](https://www.genenames.org/data/genegroup/#!/group/848), not ribosomal proteins.

## Basic knowledge
* A good review paper: [Hori, Engel and Kobayashi, Nature Reviews MCB, 2023](https://www.nature.com/articles/s41580-022-00573-9/figures/2) (Fig. 2)
* Main sequences: [RNA5S1](https://www.ncbi.nlm.nih.gov/gene/100169751) and
  [RNA45SN1](https://www.ncbi.nlm.nih.gov/gene/106631777)
* RNA45SN1 contains 3 segments after processing: 45S pre-rRNA -> 18S, 5.8S and 28S.
* These sequences are highly repetitive on the genome, particularly chromosome 21, KI270733.1, and GL000220.1. see [this discussion](https://www.biostars.org/p/9542800/)

## Mapping to genome or transcriptome
* genome: >80% multi-mapping reads of the whole library (due to rRNA)
* transcriptome: same issue of multi-mapping as above, but maybe easy to focus given the small number of transcripts

## GTF annotations
* In [GENCODE](https://www.gencodegenes.org/human/), there are 546 rRNA genes (each gene has one transcript with one exon).
* 10x Genomics's genes.gtf doesn't contain annotations for rRNA
