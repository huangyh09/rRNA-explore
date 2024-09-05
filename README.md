# rRNA-explore
Exploratory note for ribosomal RNA analysis from RNA-Seq

## Basic knowledge
* A good review paper [Hori, Engel and Kobayashi](https://www.nature.com/articles/s41580-022-00573-9) (Fig. 2)
* Gene structure of one repetitive sequence: 45S pre-rRNA -> 18S, 5.8S and 28S. See [45S sequence](https://www.ncbi.nlm.nih.gov/gene?cmd=Retrieve&dopt=Graphics&list_uids=100861532)
* ~~human: 64 non-coding RNAs (2 from mitochondria); see [HGNC group](https://www.genenames.org/data/genegroup/#!/group/848)~~
* highly repetitive on genome, particularly chromosome 21, KI270733.1, and GL000220.1. see [this discussion](https://www.biostars.org/p/9542800/)
* Examples: [RNA5S1](https://asia.ensembl.org/Homo_sapiens/Gene/Summary?g=ENSG00000199352;r=1:228610268-228610386;t=ENST00000362482),
  [RNA45SN1](https://www.ncbi.nlm.nih.gov/gene/106631777)

## Mapping to genome or transcriptome
* genome: >80% multi-mapping reads of the whole library (due to rRNA)
* transcriptome: same issue of multi-mapping as above, but maybe easy to focus given the small number of transcripts

## GTF annotations
* In [GENCODE](https://www.gencodegenes.org/human/), there are 546 rRNA genes (each gene has one transcript with one exon).
* 10x Genomics's genes.gtf doesn't contain annotations for rRNA
