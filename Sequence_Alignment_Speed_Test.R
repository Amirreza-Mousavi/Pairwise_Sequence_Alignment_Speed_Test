###Pairwise Sequence Alignment Speed Test
###SeyyedAmirreza Mousavi Majd

library(Biostrings)
library(dplyr)
library(ggplot2)
library(here)

#setwd("C:/Users/Amirreza/Desktop/Short scripts github/")
#or a better option :

setwd(here())
NSEQ=5 ###test speed for random sequences of 
       ###length 50,100,150,...,(NSEQ*50) residue

Create_Random_BioString = function(grp="DNA",N_Residue=100){
  ##grp=="DNA" -> DNAstring
  ##grp!="DNA" -> AAstring
  
  if(grp=="DNA"){
    string1 <- DNAString(paste(sample(DNA_BASES, N_Residue, replace = TRUE), collapse = ""))
  }
  else {
    string1 <- AAString(paste(sample(AA_STANDARD, N_Residue, replace = TRUE), collapse = ""))
  }
  return(string1)
  
}

result=tibble(.rows = NSEQ)

for(GRP in c("DNA","AA")){
for(aln_type in c("global","local")){
for(j in 1:5){
###test for DNA/AA string Global and Local, with different # of residues.
N <- as.integer(seq(50, NSEQ*50, by = 50))
timings <- rep(0, length(N))
names(timings) <- as.character(N)

for (i in 1:(length(N))) {
  string1 <- Create_Random_BioString(GRP,N[i])
  string2 <- Create_Random_BioString(GRP,N[i])
  timings[i] <- system.time(pairwiseAlignment(string1, string2, type = aln_type))[["user.self"]]
}
result=bind_cols(result,as_tibble(timings))

}
  
}
  
}

print(result)

###Renaming columns for better representation.
p=1
result=as.data.frame(result)
col_name_temp=rep(NA,20)
for(GRP in c("DNA","AA")){
  for(aln_type in c("global","local")){
    for(j in 1:5){
      LABEL=paste0(GRP,aln_type,j)
      col_name_temp[p]=LABEL
      p=p+1
    }
  }
}
colnames(result)=col_name_temp
print(result)
result=as_tibble(result)

###Save the result into a csv file
write.csv(result,paste0("SAST","_",toString(NSEQ),".csv"))

###Statistical tests maybe for another time :)