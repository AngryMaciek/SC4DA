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
Alternatively, you can pull the container from the dockerhub:
```bash
docker pull angrymaciek/sc4da
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

Importrant:  
Plase make sure that YAML specifies compiler packages that fit your OS. In other case, modify entries.  
  
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
Versions of software listed in the YAML file are not specified on purpose. Due to high number of packages and ambiguity of the host OS (in case of virtual environment creation) matching all the versions is left out to `conda` which always attempts to install the newest versions possible. In case the user requires a specific version of a given package/tool please specify it in the YAML prior to building the environment.  
  
Available software include:
* [ Anaconda New Compilers](https://www.anaconda.com/utilizing-the-new-compilers-in-anaconda-distribution-5/) for C, C++ and Fortran,
* [Python](https://www.python.org/), [IPython](https://ipython.org/), [Perl](https://www.perl.org/) and [R](https://www.r-project.org/) interpreters
* [Make](https://www.gnu.org/software/make/manual/make.html) and [CMake](https://cmake.org/)
* [Git](https://git-scm.com/)
* [Cookiecutter](https://github.com/cookiecutter/cookiecutter)
* [Vim](https://github.com/vim/vim)
* [bedtools](https://bedtools.readthedocs.io/en/latest/), [Samtools](http://www.htslib.org/), [pybedtools](https://daler.github.io/pybedtools/), [pysam](https://pysam.readthedocs.io/en/latest/api.html)
* [sqlite](https://www.sqlite.org/index.html)
* [snakemake](https://snakemake.readthedocs.io/en/stable/)
*  [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/)
* [sphinx](http://www.sphinx-doc.org/en/master/), [tqdm](https://github.com/tqdm/tqdm), [pytest](https://docs.pytest.org/en/latest/), [Pylint](https://www.pylint.org/)
* [Biopython](https://biopython.org/)
* [rpy2](https://rpy2.readthedocs.io/en/version_2.8.x/)
* [NumPy](https://numpy.org/), [SciPy](https://www.scipy.org/), [Statsmodels](https://www.statsmodels.org/stable/index.html), [pandas](https://pandas.pydata.org/)
* [Matplotlib](https://matplotlib.org/), [seaborn](https://seaborn.pydata.org/), [Bokeh](https://bokeh.pydata.org/en/latest/index.html), [Plotly](https://plot.ly/python/)
* [scikit-learn](https://scikit-learn.org/stable/)
* r-essentials
* [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html)
* [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html), [numDeriv](https://cran.r-project.org/web/packages/numDeriv/index.html), [maxLik](https://cran.r-project.org/web/packages/maxLik/index.html), [statmod](https://cran.r-project.org/web/packages/statmod/index.html)
* [gplots](https://cran.r-project.org/web/packages/gplots/index.html), [tidyverse](https://www.tidyverse.org/), [tsibble](https://cran.r-project.org/web/packages/tsibble/index.html)
* [future](https://cran.r-project.org/web/packages/future/index.html), [furrr](https://cran.r-project.org/web/packages/furrr/index.html)

... as well as their dependencies. Full installation logs are available in the build.log file of this repository (which is essentially a redirected standard output of `docker build`). To learn about exact versions of the installed packages please refer to that file.

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
* Add theano and pymc3; issue: [https://github.com/Theano/Theano/issues/6724](https://github.com/Theano/Theano/issues/6724)
* Add DL libraries: keras and tensorflow after Theano issue us solved
* Add Jupyter lab TOC extension? There is an issue: https://github.com/jupyterlab/jupyterlab/issues/4719   - jupyterlab-toc (in YAML) from   - krinsman





## TODO 4 RELEASE1:

* once everything works push 1.0.0 to dockerhub
* it can also serve as singularity container for snakemake rules, snakemake called from venv that has it (this one!)
* test all the instructions described here