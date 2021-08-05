# PhyloSeq2LEfSe
# Language: R
# Input: TXT (keyword-value pairs)
# Output: TXT
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: phyloseqCompanion_0.2.1, microbiome_1.12.0

PluMA plugin to take PhyloSeq-compatible input data and translate
into a format that can be analyzed by LEfSe.

The plugin accepts as input a tab-delimited parameter file of keyword value pairs:
OTU: OTU table
TAX: TAX table
META: metadata
LEVEL: phylogenetic level to perform analysis (1-7, where 1 is kingdom and 7 is species)

The output TXT file can then be analyzed by LEfSe for potential biomarkers
