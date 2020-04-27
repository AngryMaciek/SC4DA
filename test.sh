#!/usr/bin/env bash

###############################################################################
#
#   Test script for the container build
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 06-10-2019
#   LICENSE: Apache_2.0
#   USAGE: bash test.sh
#
###############################################################################

set -eo pipefail

echo $(bash --version)
echo $(conda --version)
echo $(make --version)
echo $(cmake --version)
echo $(vim --version | head -n 1)
echo $(git --version)
echo $(cookiecutter --version)
echo $(singularity --version)
echo "sqlite3 version: "$(sqlite3 --version)
echo $(python --version)
echo $(pip --version)
echo "IPython version: "$(ipython --version)
echo $(R --version | head -n 1)
hash rstudio
echo $(perl --version | head -n 2 | tail -n 1)
echo "Snakemake version: "$(snakemake --version)
echo $(nextflow -v)
echo $(nf-core --version)
echo "Jupyter Lab version: "$(jupyter-lab --version)
echo "BeakerX version: "$(beakerx --version)
echo $(black --version)
echo $(pylint --version | head -n 1)
echo $(clang-format --version)
echo $(cpplint --version | head -n 2 | tail -n 1)
echo "beautysh version: "$(beautysh --version)
echo $(shellcheck --version | head -n 2)
echo $(sphinx-build --version)
echo $(magick --version)
echo $(dot -V)

echo "=== TEST FINISHED SUCCESSFULLY ==="
