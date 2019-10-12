##############################################################################
#
#   Test script for the container build
#
#   AUTHOR: Maciej_Bak
#   AFFILIATION: Swiss_Institute_of_Bioinformatics
#   CONTACT: wsciekly.maciek@gmail.com
#   CREATED: 07-10-2019
#   LICENSE: GPL
#   USAGE: python test.py
#
##############################################################################

# imports

import os
import sys
import time
import logging
import argparse
import setuptools

import pytest
import pylint
import black
import sphinx
import jinja2
import tqdm

import pybedtools
import pysam
import yaml
import Bio

import numpy
import scipy
import statsmodels
import pandas

import matplotlib
import seaborn
import bokeh
import plotly

import rpy2

import sklearn
import mkl
import pygpu
import theano
import pymc3
import tensorflow
import keras