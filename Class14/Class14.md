Class14
================
Alicia Pacheco
November 15, 2018

Class 14 Examine Astma SNP's
----------------------------

Section 1: Identify genetic variants of interest
------------------------------------------------

Asthma SNPs in MXL ansestry

``` r
mxl<-read.csv("373531-SampleGenotypes-Homo_sapiens_Variation_Sample_rs8067378.csv")

head(mxl)
```

    ##   Sample..Male.Female.Unknown. Genotype..forward.strand. Population.s.
    ## 1                  NA19648 (F)                       A|A ALL, AMR, MXL
    ## 2                  NA19649 (M)                       G|G ALL, AMR, MXL
    ## 3                  NA19651 (F)                       A|A ALL, AMR, MXL
    ## 4                  NA19652 (M)                       G|G ALL, AMR, MXL
    ## 5                  NA19654 (F)                       G|G ALL, AMR, MXL
    ## 6                  NA19655 (M)                       A|G ALL, AMR, MXL
    ##   Father Mother
    ## 1      -      -
    ## 2      -      -
    ## 3      -      -
    ## 4      -      -
    ## 5      -      -
    ## 6      -      -

Now focus on 2nd column that contains geneotype

``` r
#genotype percentages

genotypes<-round(table (mxl[,2])/nrow(mxl)*100,2)

genotypes
```

    ## 
    ##   A|A   A|G   G|A   G|G 
    ## 34.38 32.81 18.75 14.06

Section 2: Initial RNA-seq anlysis
----------------------------------

4th line in the fastq files are the scores in ascii

``` r
#install.packages("gtools")
#install.packages("seqinr")


library(seqinr)
library(gtools) 
phred <- asc(s2c("DDDDCDEDCDDDDBBDDDCC@") ) - 33
phred 
```

    ##  D  D  D  D  C  D  E  D  C  D  D  D  D  B  B  D  D  D  C  C  @ 
    ## 35 35 35 35 34 35 36 35 34 35 35 35 35 33 33 35 35 35 34 34 31

Section 4: Population scale analysis
------------------------------------

One sample is obviously not enough to know what is happening in a population. You are interested in assessing genetic differences on a population scale.
Read file into project

``` r
#read the file 
expr<-read.table("rs8067378_ENSG00000172057.6.txt")

inds.aa<-expr$geno=="A/A"


summary(expr$exp[inds.aa])
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   11.40   27.02   31.25   31.82   35.92   51.52

``` r
#This is the variation 
inds.ag<-expr$geno=="A/G"


summary(expr$exp[inds.ag])
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   7.075  20.626  25.065  25.397  30.552  48.034

``` r
#This is teh WT
inds.gg<-expr$geno=="G/G"


summary(expr$exp[inds.gg])
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   6.675  16.903  20.074  20.594  24.457  33.956

We can make a boxplot here

``` r
#by looking at the Insect Spray example we conclude that

boxplot(exp ~ geno, data = expr)
```

![](Class14_files/figure-markdown_github/unnamed-chunk-7-1.png)

Does the SNP effect the expression of ORMDL3? Yes the AA genotype affects expression of the gene.
