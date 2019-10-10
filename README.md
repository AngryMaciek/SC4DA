# SC4DA
*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating an environment with standard tools that I use for widely understood data analysis.

## Notes:
* Rstudio is not available since it is not available by conda. Therefore no packages development. All interactive work in Jupyter Lab, but interactive work and git are for conda env, not docker! Dual action: container and venv (for dev)
* it can also serve as singularity container for snakemake rules, snakemake called from venv that has it (this one!)
* Anaconda gCC, g++, fortran compilers

## Creating and running a docker container

## Creating a conda virtual environment

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

## Next releases:
* Add Rstudio, roxygen2, devtools and usethis back, test packages and git integration in Rstudio, follow R package developmnent tutorial in VENV
* Add DL libraries: keras and tensorflow
* Add Jupyter lab TOC extension? There is an issue: https://github.com/jupyterlab/jupyterlab/issues/4719   - jupyterlab-toc (in YAML) from   - krinsman







## TODO:

* Notes
* CONDA ENV: Test JupyterLab test R notebooks with Rcpp, Rpy2, compiler calls in bash cells
* README: add instructions how to build/run, upload/pull from dockerhub, create VENVs, describe all the software that is here with links, Conda attempts to install the newest, if you need anythign else, specify exact versions in YAML, list major packages here, all in build.log !!!
* **theano, pymc3!!!**
