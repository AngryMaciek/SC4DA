# SC4DA
*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating a Docker container with standard tools that I use for widely understood data analysis.

## Creating and running the container

## Software

## Repository

This repository consist of seven files:

| File  | Description |
| ------ | ------ |
| README.md | (this file) |
| Dockerfile | Instructions for docker build |
| test.sh | Test script for the installed software |
| test.r | Test script for the installed software |
| test.py | Test script for the installed software |
| build.log | Standard output after `docker build ...` command |
| conda_packages.yaml | Software that will be installed with `conda` |

## TODO:

* Test RStudio (server?) and JupyterLab - export port?
* Test git+github, export port?
* simplify yaml by dependancies, list major packages here, all in build.log
* add instructions how to build/run, upload/pull from dockerhub, create VENVs
* test creating Python packages
* test creating R packages
* specify exact versions in YAML
* test all in SH
* test all in PY
* test all in R
* add C and C++ conda compilers