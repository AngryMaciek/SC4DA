#!/usr/bin/env bash

###############################################################################
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 26-04-2020
#   LICENSE: Apache_2.0
#   USAGE: bash create-conda-virtual-environment.sh
#
###############################################################################

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
conda env create --file $CWD/environment.yml -p $CWD/env --quiet

# install the dependancies for LaTeX
source ~/miniconda3/etc/profile.d/conda.sh
conda activate $CWD/env
R -e "library('tinytex'); tinytex::install_tinytex()"

# rstudio from conda forge requires stringi-1.4.3 which is not compiled
# properly. The problem is fixed in stringi-1.4.6 from conda-forge, however
# rstudio=1.1.456 from r requires older version.
# Install dll compiled against the OS from R
source ~/miniconda3/etc/profile.d/conda.sh
conda activate $CWD/env
R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/stringi/stringi_1.4.5.tar.gz', repos=NULL, type='source')"
