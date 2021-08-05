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
  level <<- as.numeric(parameters["LEVEL", 2])
}

run <- function() {

}

output <- function(outputfile) {

  #y = tax_glom(x, "Rank6")
  print("READY TO RUN")
#print(row.names(otu_table(x)))
  taxalevels = c("Rank1")
  if (level >= 2) {
     taxalevels = c(taxalevels, "Rank2")
  }
  if (level >= 3) {
     taxalevels = c(taxalevels, "Rank3")
  }
  if (level >= 4) {
     taxalevels = c(taxalevels, "Rank4")
  }
  if (level >= 5) {
     taxalevels = c(taxalevels, "Rank5")
  }
  if (level >= 6) {
     taxalevels = c(taxalevels, "Rank6")
  }
  if (level >= 7) {
     taxalevels = c(taxalevels, "Rank7")
  }

      	phyloseq2lefse(x, c("Description"), file.name=outputfile, taxa.levels=taxalevels, transpose.otus=TRUE)
}
