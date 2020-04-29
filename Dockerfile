###############################################################################
#
#   Dockerfile for the container
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 06-10-2019
#   LICENSE: Apache_2.0
#
###############################################################################

# BASE IMAGE
FROM continuumio/miniconda3:4.8.2

# METADATA
LABEL base.image="miniconda3:4.8.2"
LABEL version="2.0.0"
LABEL software="SC4DA"
LABEL software.version="2.0.0"
LABEL software.description=\
"Environment with tools and packages for data analysis."
LABEL maintainer="wsciekly.maciek@gmail.com"
LABEL maintainer.organisation="Swiss Institute of Bioinformatics"
LABEL maintainer.location=\
"Klingelbergstrasse 50/70, CH-4056 Basel, Switzerland"

# INSTALL C AND C++ COMPILERS
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y g++

# for xetex in R
RUN apt-get install -y libfontconfig

# VARIABLES
ARG WORKDIR="/home/container/"
ARG USER="USER"
ARG GROUP="GROUP"
ARG THEANO_COMPILEDIR="/home/USER/.theano"
ARG NEXTFLOW_DIR="/home/USER/.nextflow"
ARG NFCORE_DIR="/home/USER/.nfcore"
ARG TINYTEX_DIR="/home/USER/.TinyTeX"
ARG USER_LOCAL="/home/USER/.local"
ENV PATH="${WORKDIR}:${PATH}"

# COPY THE YAML & INSTALL SOFTWARE WITH CONDA
COPY environment.yml ${WORKDIR}/environment.yml
RUN conda env update --name base --file ${WORKDIR}/environment.yml && \
conda clean --all --force-pkgs-dirs --yes

# COPY THE TEST SCRIPTS
COPY test.sh ${WORKDIR}/test.sh
COPY test.r ${WORKDIR}/test.r
COPY test.py ${WORKDIR}/test.py

# CREATE USER
RUN groupadd -r ${GROUP} && useradd --no-log-init -r -g ${GROUP} ${USER}

# SET ENVIRONMENT & CREATE INTERNAL DIRS FOR THEANO AND NEXTFLOW
WORKDIR ${WORKDIR}
RUN \
chown -R ${USER}:${GROUP} ${WORKDIR} && \
chmod 700 ${WORKDIR} && \
mkdir -p ${THEANO_COMPILEDIR} && \
chmod 777 ${THEANO_COMPILEDIR} && \
mkdir -p ${NEXTFLOW_DIR} && \
chmod 777 ${NEXTFLOW_DIR} && \
mkdir -p ${NFCORE_DIR} && \
chmod 777 ${NFCORE_DIR} && \
mkdir -p ${TINYTEX_DIR} && \
chmod 777 ${TINYTEX_DIR} && \
mkdir -p ${USER_LOCAL} && \
chmod 777 ${USER_LOCAL}



# INSTALL DEPENDANCIES FOR LATEX
#RUN conda activate base && \
#RUN R -e "library('tinytex'); tinytex::install_tinytex()"

# INSTALL MISSING DLL
#RUN conda activate base && \
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/stringi/stringi_1.4.5.tar.gz', repos=NULL, type='source')"


USER ${USER}
