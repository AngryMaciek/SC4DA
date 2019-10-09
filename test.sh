#!/usr/bin/env bash

###############################################################################
#
#   Test script for the container build
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 06-10-2019
#   LICENSE: GPL
#   USAGE: bash test.sh
#
###############################################################################

echo "TESTING CONDA:"
echo $(conda --version)
echo ""

echo "TESTING COOKIECUTTER:"
echo $(cookiecutter --version)
echo ""

echo "TESTING GIT:"
echo $(git --version)
echo ""

echo "TESTING SQLITE:"
echo $(sqlite3 --version)
echo ""

echo "TESTING MAKE AND CMAKE:"
echo $(make --version)
echo $(cmake --version)
echo ""

echo "TESTING C, C++ AND FORTRAN COMPILERS:"
echo $(x86_64-conda_cos6-linux-gnu-gcc --version)
echo $(x86_64-conda_cos6-linux-gnu-c++ --version)
echo $(x86_64-conda_cos6-linux-gnu-gfortran --version)
echo ""

echo "TESTING PERL:"
echo $(perl --version)
echo ""

echo "TESTING PYTHON, IPYTHON AND PYTHON PACKAGES:"
echo $(python --version)
echo "IPython "$(ipython --version)
python test.py
echo ""

echo "TESTING IMAGEMAGICK:"
echo $(magick --version)
echo ""

echo "TESTING SNAKEMAKE:"
echo $(snakemake --version)
echo ""

echo "TESTING R AND R PACKAGES:"
echo $(R --version)
Rscript test.r
echo ""

echo "TESTING JUPYTER LAB:"
echo $(jupyter-lab --version)
echo ""

#echo "TESTING RSTUDIO:"
#echo $(Rstudio --version)
