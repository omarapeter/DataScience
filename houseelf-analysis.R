

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

