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
  descr <<- toString(parameters["DESC", 2])
}

run <- function() {

}

output <- function(outputfile) {

  #y = tax_glom(x, "Rank6")
  print("READY TO RUN")
#print(row.names(otu_table(x)))
  usingRanks <<- FALSE
  if (colnames(tax_table(x))[1] == "Rank1") {
     usingRanks <<- TRUE
  }
  if (usingRanks) {
     taxalevels = c("Rank1")
  }
  else {
     taxalevels = c("Kingdom")
  }
  if (level >= 2) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank2")
	  }
	  else {
		  taxalevels = c(taxalevels, "Phylum")
	  }
  }
  if (level >= 3) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank3")
	  }
	  else {
		  taxalevels = c(taxalevels, "Class")
	  }
  }
  if (level >= 4) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank4")
	  }
	  else {
		  taxalevels = c(taxalevels, "Order")
	  }
  }
  if (level >= 5) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank5")
	  }
	  else {
		  taxalevels = c(taxalevels, "Family")
	  }
  }
  if (level >= 6) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank6")
	  }
	  else {
		  taxalevels = c(taxalevels, "Genus")
	  }
  }
  if (level >= 7) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank7")
	  }
	  else {
		  taxalevels = c(taxalevels, "Species")
	  }
  }
  if (level >= 8) {
	  if (usingRanks) {
     taxalevels = c(taxalevels, "Rank8")
	  }
	  else {
		  taxalevels = c(taxalevels, "Strain")
	  }
  }
  print(taxalevels)
      	phyloseq2lefse(x, c(descr), file.name=outputfile, taxa.levels=taxalevels, transpose.otus=TRUE)
}
