# SC4DA
*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating a Docker container with standard tools that I use for widely understood data analysis.

## Creating and running the container

## Software

## Repository

This repository consist of eight files:

| File  | Description |
| ------ | ------ |
| README.md | (this file) |
| Dockerfile | Instructions for docker build |
| test.sh | Test script for the installed software |
| test.r | Test script for the installed software |
| test.py | Test script for the installed software |
| build.log | Standard output after `docker build ...` command |
| conda_packages.yaml | Software that will be installed with `conda` |
| LICENSE | GNU General Public License |

## License

GNU General Public License



## TODO:

* Test RStudio (server?) and JupyterLab - export port?
* Test github, export port?
* add instructions how to build/run, upload/pull from dockerhub, create VENVs
* describe all the software that is here with links
* Conda attempts to install the newest, if you need anythign else, specify exact versions in YAML

* simplify yaml by dependancies, list major packages here, all in build.log !!!
* sklearn, theano, pymc3, keras, tensorflow !!! Rcpp test