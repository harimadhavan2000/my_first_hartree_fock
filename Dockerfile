FROM  beangoben/pimp_jupyter
FROM continuumio/miniconda3

USER root
# make bash default shell
RUN ln -snf /bin/bash /bin/sh
RUN apt-get update && \
    apt-get install -y python-pip gfortran liblapacke-dev liblapack-dev \
    libatlas-base-dev libpng-dev libfreetype6-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -ms /bin/bash jovyan    

USER jovyan
#python 2
# update packages
#RUN conda update -n python2 matplotlib scipy numpy seaborn --quiet --yes && \
#    conda clean --all

# packages

RUN conda create -n env python=2.7
RUN conda install -n env -c rdkit rdkit --quiet --yes && \
#RUN conda install -n rdkit rdkit --quiet --yes && \
    conda clean --all
RUN conda install -n env -c openbabel openbabel --quiet --yes && \
#RUN conda install -n openbabel openbabel --quiet --yes && \
    conda clean --all
RUN pip2 install --no-cache imolecule
RUN wget http://downloads.sourceforge.net/project/pyquante/PyQuante-1.6/PyQuante-1.6.5/PyQuante-1.6.5.tar.gz &&\
    tar xzvf PyQuante-1.6.5.tar.gz &&\
    source activate env &&\
    cd PyQuante-1.6.5 && \
    python setup.py install && \
    cd .. && \





