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
LABEL maintainer="Maciej Bak"
LABEL maintainer.email="wsciekly.maciek@gmail.com"
LABEL maintainer.organisation="Swiss Institute of Bioinformatics"
LABEL maintainer.location=\
"Klingelbergstrasse 50/70, CH-4056 Basel, Switzerland"

# PORT FOR JUPYTER LAB
EXPOSE 8888

# INSTALL C AND C++ COMPILERS
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y g++

# VARIABLES
ARG WORKDIR="/home/container/"
ARG USER="USER"
ARG GROUP="GROUP"
ARG THEANO_COMPILEDIR="/home/USER/.theano"
ARG NEXTFLOW_DIR="/home/USER/.nextflow"
ARG NFCORE_DIR="/home/USER/.nfcore"
ARG USER_LOCAL_DIR="/home/USER/.local"
ARG JUPYTER_DIR="/home/USER/.jupyter"
ARG JUPYTER_SHARE_DIR="/opt/conda/share/jupyter"
ENV PATH="${WORKDIR}:${PATH}"

# COPY THE YAML & INSTALL SOFTWARE WITH CONDA
COPY environment.yml ${WORKDIR}/environment.yml
RUN conda env update --name base --file ${WORKDIR}/environment.yml && \
conda clean --all --force-pkgs-dirs --yes

# INSTALL MISSING DLL
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/stringi/stringi_1.4.5.tar.gz', repos=NULL, type='source')"

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
mkdir -p ${USER_LOCAL_DIR} && \
chmod 777 ${USER_LOCAL_DIR} && \
mkdir -p ${JUPYTER_DIR} && \
chmod 777 ${JUPYTER_DIR} && \
mkdir -p ${JUPYTER_SHARE_DIR} && \
chmod -R 777 ${JUPYTER_SHARE_DIR}
USER ${USER}
