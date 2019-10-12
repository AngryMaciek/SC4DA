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
library("assertthat")
library("RColorBrewer")

library("Rcpp")
library("numDeriv")
library("maxLik")
library("statmod")

library("tidyverse")
library("gplots")
library("cowplot")
library("tsibble")

library("future")
library("furrr")