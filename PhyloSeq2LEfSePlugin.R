library(microbiome)
library(phyloseqCompanion)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  pfix = prefix()

  parameters <- read.table(inputfile, as.is=T);
  rownames(parameters) <- parameters[,1]
  print(parameters["OTU", 2])
  otu_file <- paste(pfix, toString(parameters["OTU", 2]), sep="/")
  tax_file <- paste(pfix, toString(parameters["TAX", 2]), sep="/")
  sample_file <- paste(pfix, toString(parameters["META", 2]), sep="/")
  x <<- read_csv2phyloseq(otu.file = otu_file, taxonomy.file = tax_file, metadata.file = sample_file, sep=",")

}

run <- function() {

}

output <- function(outputfile) {

  phyloseq2lefse(x, c("Description"), file.name=outputfile, taxa.levels=c("Rank1", "Rank2", "Rank3", "Rank4", "Rank5", "Rank6"), transpose.otus=TRUE)

}
