# SC4DA
*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating an environment with standard tools that I use for widely understood data analysis.

## Notes:
* The following repository might be utilised to build a virtual environment for exploratory data analysis, tool/package/workflow development as well as blueprints for a container to execute software in.
* All of the software is managed by [Miniconda3](https://docs.conda.io/en/latest/miniconda.html). This is especially important for C, C++ and Fortran compilers (explained below).
* Interactive data analysis can be carried out in [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/). Currently two kernels are installed: Python and R.

## Creating and running a docker container
Provided you have `docker` installed. In order to build a container clone this repository and execute `docker build`:
```bash
cd;
git clone https://github.com/AngryMaciek/SC4DA.git;
docker build -f SC4DA/Dockefile --tag=sc4da:v1.0.0 SC4DA
```
To test if all the software is installed properly type:
```bash
docker run sc4da:v1.0.0
```
Activate the container, explore the commands and play inside with:
```bash
docker run -it sc4da:v1.0.0 bash
```
Provided that the container is already running you can execute commands within with:
```bash
docker exec -it [CONTAINER_ID] [COMMAND]
```

## Creating a conda virtual environment
To avoid technical difficulties I prefer to have a virtual environment for interactive work and development. The requirement here is that in order to build one the user needs to have [miniconda installed](https://conda.io/projects/conda/en/latest/user-guide/install/index.html). Virtual environment created based on this repository will have exactly the same software as the container.  
  
In order to create a conda virtual environment type:
```bash
cd;
git clone https://github.com/AngryMaciek/SC4DA.git;
conda env create --prefix ENV --file SC4DA/conda_packages.yaml
```
Activate it with:
```bash
conda activate ~/ENV
```


## Software
describe all the software that is here with links, Conda attempts to install the newest, if you need anythign else, specify exact versions in YAML, list major packages here, all in build.log !!!

* Anaconda gCC, g++, fortran compilers

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





## TODO 4 RELEASE1:

* CONDA ENV: Test JupyterLab test R notebooks with Rcpp, Rpy2, compiler calls in bash cells
* **theano, pymc3!!!**
* it can also serve as singularity container for snakemake rules, snakemake called from venv that has it (this one!) | add this note after I uploaad to my DOckerhub, instruction how to pull from dockerhub
* test all the instructions described here