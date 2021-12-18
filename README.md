# Pairwise_Sequence_Alignment_Speed_Test
An R script to measure the potenial influence of different paramaters that could have effected the speed of pairwise sequence alignment, using the "pairwsieAlignment" function of the Biostrings package.

---------------------------------------------------------------------------------------------------------
## Installation
Make sure to have installed the folowing packages : [Biostrings,](https://bioconductor.org/packages/release/bioc/html/Biostrings.html) [dplyr,](https://dplyr.tidyverse.org/) [ggplot2,](https://ggplot2.tidyverse.org/) and [here](https://here.r-lib.org/)

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Biostrings")
```

```
install.packages("dplyr")
```

```
install.packages("ggplot2")
```

```
install.packages("here")
```

----------------------------------------------------------------------------------------------------------
## More Details
The Script uses the functionalities provided in Base-R (`system.time()` command) to measure how long it takes for the computer to run a pairwise alignment task. I have first generated random sequences of DNA and Protein to use as data, then performed alignments. One might assume that it should take different times for the system to perform the task depending that the requested alignment is for Protein or DNA, for Local or Global alignment, with short sequneces or long sequences.

The script records all the times in seconds, and finally outputs the results in a csv file.
The `NSEQ` variable determines how long the random sequences should be for the speed test.

**NOTE:** The result `"SAST_100.csv"` shows that *the type of alignment(Local or Global)* or *the nature of the sequences (AA or DNA)* **DOES NOT** affect the time needed to complete the alignment, but only *the size of the sequence* plays a critical role.

**NOTE:** I haven't performed the statistical analysis and visualization on the dataset yet, maybe in the future.



