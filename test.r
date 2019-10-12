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

library("optparse")
suppressMessages(library("assertthat"))
library("RColorBrewer")

library("Rcpp")
library("numDeriv")
suppressMessages(library("maxLik"))
library("statmod")

suppressMessages(library("tidyverse"))
suppressMessages(library("gplots"))
suppressMessages(library("cowplot"))
suppressMessages(suppressWarnings(library("tsibble")))

library("future")
library("furrr")
