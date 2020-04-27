###############################################################################
#
#   Test script for the container build
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 07-10-2019
#   LICENSE: Apache_2.0
#   USAGE: Rscript test.r
#
###############################################################################

# load libraries

library("assertthat")
library("optparse")
library("usethis")
library("roxygen2")
library("devtools")
library("ProjectTemplate")
library("future")
library("furrr")

library("lintr")
library("styler")

library("RColorBrewer")
library("gplots")
library("cowplot")

library("Rcpp")
library("numDeriv")
library("maxLik")
library("statmod")
library("tidyverse")
library("tidymodels")
library("tsibble")

print("=== TEST FINISHED SUCCESSFULLY ===")
