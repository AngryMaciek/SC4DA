###############################################################################
#
#   Dockerfile for the container
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 06-10-2019
#   LICENSE: GPL
#
###############################################################################

# BASE IMAGE
FROM continuumio/miniconda3:4.7.10

# METADATA
LABEL base.image="miniconda3:4.7.10"
LABEL version="1.5.0"
LABEL software="SC4DA"
LABEL software.version="1.5.0"
LABEL software.description=\
"Environment with standard packages for data analysis."
LABEL maintainer="wsciekly.maciek@gmail.com"
LABEL maintainer.organisation="Swiss Institute of Bioinformatics"
LABEL maintainer.location=\
"Klingelbergstrasse 50/70, CH-4056 Basel, Switzerland"

# INSTALL C AND C++ COMPILERS
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y g++

# COPY THE YAML & INSTALL SOFTWARE WITH CONDA
COPY conda_packages.yaml .
RUN conda env update --name base --file conda_packages.yaml
RUN conda clean -all

# VARIABLES
ARG WORKDIR="/home/container/"
ARG USER="USER"
ARG GROUP="GROUP"
ARG THEANO_COMPILEDIR="/home/USER/.theano"
ENV PATH="${WORKDIR}:${PATH}"

# COPY THE TEST SCRIPTS
COPY test.sh ${WORKDIR}/test.sh
COPY test.r ${WORKDIR}/test.r
COPY test.py ${WORKDIR}/test.py

# CREATE USER
RUN groupadd -r ${GROUP} && useradd --no-log-init -r -g ${GROUP} ${USER}

# SET ENVIRONMENT
WORKDIR ${WORKDIR}
RUN chown -R ${USER}:${GROUP} ${WORKDIR} && chmod 700 ${WORKDIR}
RUN mkdir -p ${THEANO_COMPILEDIR} && chmod 777 ${THEANO_COMPILEDIR}
USER ${USER}

# TEST UPON CONTAINER LAUNCH
CMD ["bash", "test.sh"]
