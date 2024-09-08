# rRNA-explore
Exploratory note for ribosomal RNA analysis from RNA-Seq

Note, it's for the genes of [ribosomal RNA](https://www.genenames.org/data/genegroup/#!/group/848), not ribosomal proteins.

## Basic knowledge
* A good review paper: [Hori, Engel and Kobayashi, Nature Reviews MCB, 2023](https://www.nature.com/articles/s41580-022-00573-9/figures/2) (Fig. 2)
* Main sequences: [RNA5S1](https://www.ncbi.nlm.nih.gov/gene/100169751) and
  [RNA45SN1](https://www.ncbi.nlm.nih.gov/gene/106631777)
* RNA45SN1 contains 3 segments after processing: 45S pre-rRNA -> 18S, 5.8S and 28S.
* These sequences are highly repetitive on the genome, particularly chromosome 21, KI270733.1, and GL000220.1. see [this discussion](https://www.biostars.org/p/9542800/)
* [GENCODE](https://www.gencodegenes.org/human/) or 10x Genomics's genes.gtf 
  doesn't contain good annotations for rRNA (or at all).


## Suggested strategy

1. mapping RNA-seq reads to rRNA reference, e.g., via our manually compiled one
   [rRNAanno](./rRNAanno), by using STAR
2. mapping the unmapped reads to the genome, by using STAT again

> As an example, the Huen dataset is analyzed with this strategy.


## Other suboptimal strategies

### RiboDetector
Alternative 1: using [RiboDetector](https://academic.oup.com/nar/article/50/10/e60/6533611)
to remove the rRNA first by using rRNA sequences 
(via [SILVA](https://www.arb-silva.de/no_cache/download/archive/current/Exports/)) 
trained machine learning classifier.

Two issues:
* It removes rRNA, not focusing on analysing rRNA
* It seems not as sensitive as our suggested strategy by simply mapping to human
  rRNA 5S and 45S. See comparison results in 
  [rRNA-mapping-strategies.xlsx](huenRNA/analysis/rRNA-mapping-strategies.xlsx)
  
> Note, in both the suggested and this alternative strategies, a high proportion
of the unmapped reads are still mapped to multiple loci on genome, possibly due 
to other categories of non-coding RNAs that have multiple copies on genome?

### Simply mapping to human genome (or transcriptome) directly
This would be a poor strategy with many multi-mapping reads due to the 
repetitive sequences:
* genome: >80% multi-mapping reads of the whole library (due to rRNA)
* transcriptome: same issue of multi-mapping as above, but maybe easy to focus 
  given the small number of transcripts
