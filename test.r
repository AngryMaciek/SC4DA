###############################################################################
#
#   Test script for the container build
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 07-10-2019
#   LICENSE: GPL
#   USAGE: Rscript test.r
#
###############################################################################

# load libraries
library("usethis")
library("devtools")
library("roxygen2")
library("optparse")
library("Rcpp")
library("numDeriv")
suppressMessages(library("maxLik"))
library("RColorBrewer")
library("shiny")
suppressMessages(library("tidyverse"))