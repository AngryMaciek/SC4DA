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
library("Rcpp")
library("numDeriv")
suppressMessages(library("maxLik"))
library("RColorBrewer")
suppressMessages(library("tidyverse"))
suppressMessages(library("gplots"))
suppressMessages(library("assertthat"))
library("statmod")
library("future")
library("furrr")
suppressMessages(suppressWarnings(library("tsibble")))