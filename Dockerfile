# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/pyspark-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# RSpark config
ENV R_LIBS_USER $SPARK_HOME/R/lib
RUN fix-permissions $R_LIBS_USER

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

# R packages
RUN conda install --quiet --yes \
    'r-base=3.4.1' \
    'r-irkernel=0.8*' \
    'r-ggplot2=2.2*' \
    'r-sparklyr=0.7*' \
    'r-rcurl=1.95*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER root
# Install NLTK
RUN conda install --quiet --yes 'nltk' &&\
    conda install -c https://conda.anaconda.org/sloria textblob &&\
    conda install -c conda-forge ggplot && \
    conda clean -tipsy && \
    python -m nltk.downloader -d /usr/share/nltk_data all && \
    python -m textblob.download_corpora && \
    rm -rf /home/$NB_USER/.local && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER $NB_UID
