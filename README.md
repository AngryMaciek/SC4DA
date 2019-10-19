# SC4DA
*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating an environment with standard tools that I use for widely understood data analysis.

## Notes:
* The following repository might be utilised to build a virtual environment for exploratory data analysis, tool/package/workflow development as well as blueprints for a container to execute software in.
* Base image for the container is linux amd64 therefore all of the software specified is meant to be installed on such architecture.
* Almost all of the software is managed by [Miniconda3](https://docs.conda.io/en/latest/miniconda.html). The only tools installed outside of the environment are C and C++ compilers.
* Interactive data analysis can be carried out in [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/). Currently two kernels are installed: Python and R.

## Creating and running a docker container
Provided you have `docker` installed. In order to build a container clone this repository and execute `docker build`:
```bash
cd;
git clone https://github.com/AngryMaciek/SC4DA.git;
docker build -f SC4DA/Dockerfile --tag=sc4da:1.6.0 SC4DA
```
To test if all the software is installed properly type:
```bash
docker run sc4da:1.6.0
```
Activate the container, explore the commands and play inside with:
```bash
docker run -it sc4da:1.6.0 bash
```
Provided that the container is already running you can execute commands within with:
```bash
docker exec -it [CONTAINER_ID] [COMMAND]
```
Alternatively to building you can pull the container from the dockerhub:
```bash
docker pull angrymaciek/sc4da:1.6.0
```
And execute the above commands with `angrymaciek/sc4da:1.1.0` container.

## Creating a conda virtual environment
To avoid technical difficulties I prefer to have a virtual environment for interactive work and development. The requirements here are that in order to build one the user needs to have [miniconda3 installed](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) and the host OS (Linux) needs to have `gcc` and `g++` installed. Assuming these requirements are fulfilled virtual environment created based on this repository will have exactly the same software as the container.  
  
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

## Snakemake pipelines execution

On top of all the above, this container might also serve as an environment to execute [snakemake](https://snakemake.readthedocs.io/en/stable/) pipelines in. Utilising snakemake built-in mechanisms `--use-conda` and `--use-singularity` you can either provide path to the YAML file (to automatically build a virtual environment for all the rules to be executed in) or a URL to this particular container on dockerhub (which will be pulled automatically). Moreover, this environment contains snakemake by itself in order to ease workflow development process.

## Software
Versions of software listed in the YAML file are not specified on purpose. Due to high number of packages matching all the versions is left out to `conda` which always attempts to install the newest versions possible. In case the user requires a specific version of a given package/tool please specify it in the YAML prior to building the environment.  
  
Available software include:
* [Python](https://www.python.org/), [IPython](https://ipython.org/), [Perl](https://www.perl.org/) and [R](https://www.r-project.org/) interpreters
* [Make](https://www.gnu.org/software/make/manual/make.html) and [CMake](https://cmake.org/)
* [Git](https://git-scm.com/)
* [Cookiecutter](https://github.com/cookiecutter/cookiecutter)
* [Vim](https://github.com/vim/vim)
* [Singularity](https://singularity.lbl.gov/)
* [bedtools](https://bedtools.readthedocs.io/en/latest/), [Samtools](http://www.htslib.org/), [pybedtools](https://daler.github.io/pybedtools/), [pysam](https://pysam.readthedocs.io/en/latest/api.html)
* [sqlite](https://www.sqlite.org/index.html)
* [snakemake](https://snakemake.readthedocs.io/en/stable/)
*  [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/)
* [sphinx](http://www.sphinx-doc.org/en/master/), [tqdm](https://github.com/tqdm/tqdm), [pytest](https://docs.pytest.org/en/latest/), [Pylint](https://www.pylint.org/), [Black](https://github.com/psf/black)
* [Biopython](https://biopython.org/)
* [rpy2](https://rpy2.readthedocs.io/en/version_2.8.x/)
* [NumPy](https://numpy.org/), [SciPy](https://www.scipy.org/), [Statsmodels](https://www.statsmodels.org/stable/index.html), [pandas](https://pandas.pydata.org/)
* [Matplotlib](https://matplotlib.org/), [seaborn](https://seaborn.pydata.org/), [Bokeh](https://bokeh.pydata.org/en/latest/index.html), [Plotly](https://plot.ly/python/)
* [scikit-learn](https://scikit-learn.org/stable/), [theano](http://deeplearning.net/software/theano/), [PyMC3](https://docs.pymc.io/), [TensorFlow](https://www.tensorflow.org/), [Keras](https://keras.io/)
* r-essentials
* [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html)
* [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html), [numDeriv](https://cran.r-project.org/web/packages/numDeriv/index.html), [maxLik](https://cran.r-project.org/web/packages/maxLik/index.html), [statmod](https://cran.r-project.org/web/packages/statmod/index.html)
* [gplots](https://cran.r-project.org/web/packages/gplots/index.html), [tidyverse](https://www.tidyverse.org/), [tsibble](https://cran.r-project.org/web/packages/tsibble/index.html)
* [future](https://cran.r-project.org/web/packages/future/index.html), [furrr](https://cran.r-project.org/web/packages/furrr/index.html)
* [cowplot](https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html)

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

GNU General Public License v3.0

## Next release:
* Add Rstudio, roxygen2, devtools and usethis back, test package development and git integration in Rstudio (follow R package developmnent tutorial in VENV)
* add r-projecttemplate
* Add BeakerX
* add Jupyter widgets
* Tensorflow raises warnings since it is not compatible with numpy 1.17+: https://github.com/tensorflow/tensorflow/issues/30427, rebuild with new TF once it is available.
* Simplify the image: https://jcrist.github.io/conda-docker-tips.html
* Add Jupyter lab TOC extension? There is an issue: https://github.com/jupyterlab/jupyterlab/issues/4719 | conda: jupyterlab-toc from krinsman channel

