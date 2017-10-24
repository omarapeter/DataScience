

#install.packages("stringr")
library(stringr)


data1 <- read.csv("data/houseelf_earlength_dna_data_1.csv")

dna_sequence <- function(sequence) {
  sequence <- str_to_lower(sequence)
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_content <- (Gs + Cs) / str_length(sequence) * 100 
  return(gc_content)
}


get_size_class <- function(ear_length){
   # Calculate the size class for one or more earth lengths
   ear_lengths <- ifelse(ear_length > 10, "large", "small")
   return(ear_lengths)
}


gccontent <- dna_sequence(data1$dnaseq)

earlength_class <- get_size_class(data1$earlength)

DF <- data.frame(data1$id, earlength_class, gccontent)

Earlength_DF <- write.csv(DF, file = "output/DF.csv")
print(Earlength_DF)
