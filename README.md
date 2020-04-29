# SC4DA

*Maciej Bak  
Swiss Institute of Bioinformatics*

This is a recipe for creating an environment with tools and packages which I use for widely understood data analysis.

In general the smaller the environment is - the better. Little number of packages imply less constraints on software versions and smaller disk space. When it comes to publishing research I highly advise to encapsulate scripts and pipelines into minimal environments necessary to execute the analyses, either with [Docker](https://www.docker.com/) or [Conda](https://docs.conda.io/en/latest/) technologies.

**That being said**

Having a dedicated environment for software development & data analysis can speed up the research significantly. Often, to avoid wasting precious time, there is a need to perform a quick-and-dirty data inspection or processing. It would be a bad idea to install all the required packages into a *main* environment. It is much safer, more efficient and cleaner to have a separate work space just like the one I present here.

## About

* The following repository might be utilized to build a *conda* virtual environment asas a *docker* container

* It may serve for both exploratory data analysis, tool/package/workflow development as well as a container to execute the software in.

* The architecture behind base image is linux, 64bit. Virtual environment is dedicated to this system.

* Interactive data inspection can be carried out in Jupyter Lab (Python and R kernels) or RStudio (R).

* Main tools and packages of the environment are listed in `environment.yml`. To see the full list please take a look at `docker-build.log`.

## Creating and running a docker container

Provided you have `docker` installed.  
In order to build a container please clone this repository and execute `docker build`:

```bash
cd $HOME
git clone https://github.com/AngryMaciek/SC4DA.git
docker build -f SC4DA/Dockerfile --tag=sc4da:2.0.0 SC4DA
```

To test if all the software have been installed properly activate the container and run test scripts:

```bash
docker run -it sc4da:2.0.0 bash
# in the bash inside the container:
bash test.sh
Rscript test.r
python test.py
```

Alternatively to building you can pull the container from the dockerhub:

```bash
docker pull angrymaciek/sc4da:2.0.0
```

## Creating a conda virtual environment

*The following section applies to Linux 64-bit OS only.*

To build a *conda* virtual environment one requires [miniconda3 installed](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) (as well as C++ and C compilers, usually available on the host machine). Assuming these requirements are fulfilled virtual environment created based on the YAML file inside this repository will have exactly the same software as the container.

In order to create a *conda* virtual environment please type:

```bash
cd $HOME;
git clone https://github.com/AngryMaciek/SC4DA.git;
bash SC4DA/create-conda-virtual-environment.sh
```

To test if all the software have been installed properly activate the environment and run test scripts:

```bash
conda activate $HOME/SC4DA/env
bash test.sh
Rscript test.r
python test.py
```

## Snakemake pipelines execution

On top of all the above, this environment might be also utilised to execute Snakemake pipelines in. Utilising snakemake built-in mechanisms `--use-conda` and `--use-singularity` you can either provide path to the YAML file (to automatically build a virtual environment for rules to be executed in) or a URL to this particular container on dockerhub (which will be pulled automatically). Moreover, this environment contains snakemake itself in order to ease workflow development process!

## Software

Versions of software listed in the YAML file are not specified on purpose. Due to high number of packages matching all the versions is left out to `conda` which always attempts to install the newest versions possible. In case the user requires a specific version of a given package/tool please specify it in the YAML prior to building the environment.

Available software include:

* [GNU Bash](https://www.gnu.org/software/bash/)

* [Python 3](https://www.python.org/), [IPython](https://ipython.org/), [Perl](https://www.perl.org/) and [R](https://www.r-project.org/) interpreters

* [Beautysh](https://github.com/lovesegfault/beautysh), [ShellCheck](https://github.com/koalaman/shellcheck), [styler](https://github.com/r-lib/styler), [lintr](https://github.com/jimhester/lintr), [Black](https://github.com/psf/black), [Pylint](https://www.pylint.org/), [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html), [cpplint](https://github.com/cpplint/cpplint)

* [Make](https://www.gnu.org/software/make/manual/make.html), [CMake](https://cmake.org/), [Snakemake](https://snakemake.readthedocs.io/en/stable/), [Nextflow](https://www.nextflow.io/) and [nf-core](https://nf-co.re/)

* [Graphviz](https://www.graphviz.org/) and [ImageMagick](https://imagemagick.org/)

* [Vim](https://github.com/vim/vim), [Git](https://git-scm.com/), [Cookiecutter](https://github.com/cookiecutter/cookiecutter), [sphinx](http://www.sphinx-doc.org/en/master/)

* [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/), [BeakerX](http://beakerx.com/), [RStudio](https://rstudio.com/)

* [Singularity](https://singularity.lbl.gov/)

* [sqlite](https://www.sqlite.org/index.html)

* [Biopython](https://biopython.org/), [tqdm](https://github.com/tqdm/tqdm), [pytest](https://docs.pytest.org/en/latest/), [Jinja](https://jinja.palletsprojects.com/)

* [NumPy](https://numpy.org/), [SciPy](https://www.scipy.org/), [Statsmodels](https://www.statsmodels.org/stable/index.html), [pandas](https://pandas.pydata.org/)

* [Matplotlib](https://matplotlib.org/), [seaborn](https://seaborn.pydata.org/), [Bokeh](https://bokeh.pydata.org/en/latest/index.html), [Plotly](https://plot.ly/python/)

* [scikit-learn](https://scikit-learn.org/stable/), [theano](http://deeplearning.net/software/theano/), [PyMC3](https://docs.pymc.io/), [TensorFlow](https://www.tensorflow.org/), [Keras](https://keras.io/), [PyTorch](https://pytorch.org/)

* [devtools](https://www.rdocumentation.org/packages/devtools), [roxygen2](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html), [usethis](https://usethis.r-lib.org/), [ProjectTemplate](http://projecttemplate.net/), [testthat](https://testthat.r-lib.org/), [future](https://cran.r-project.org/web/packages/future/index.html), [furrr](https://cran.r-project.org/web/packages/furrr/index.html)

* [r-essentials](https://docs.anaconda.com/anaconda/user-guide/tasks/using-r-language/), [tidyverse](https://www.tidyverse.org/), [tsibble](https://cran.r-project.org/web/packages/tsibble/index.html), [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html), [numDeriv](https://cran.r-project.org/web/packages/numDeriv/index.html), [maxLik](https://cran.r-project.org/web/packages/maxLik/index.html), [statmod](https://cran.r-project.org/web/packages/statmod/index.html), [Tidymodels](https://www.tidymodels.org/)

* [gplots](https://cran.r-project.org/web/packages/gplots/index.html), [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html), [cowplot](https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html)

## Repository

This repository consist of nine files:
  
| File | Description |
| ------ | ------ |
| README.md | (this file) |
| LICENSE | Apache License ver 2.0 |
| create-conda-virtual-environment.sh | Bash script to create *conda* virtual environment |
| environment.yml | Software which will be installed with `conda` |
| Dockerfile | Instructions for `docker build` |
| docker-build.log | Standard output after `docker build` command |
| test.sh | Bash test script for the installed software |
| test.r | R test script for the installed software |
| test.py | Python test script for the installed software |

## License

Apache 2.0
