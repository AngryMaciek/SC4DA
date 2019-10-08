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

echo "TESTING CONDA AND PYTHON:"
echo $(conda --version)
echo $(python --version)
echo ""

#echo "TESTING C AND C++ COMPILERS:"
#echo $(gcc --version)
#echo $(g++ --version)
#echo ""

echo "TESTING R:"
echo $(R --version)