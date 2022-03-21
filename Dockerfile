FROM jupyter/base-notebook

LABEL Yeonchan Seong  <ycseong07@gmail.com>

ENV LC_ALL=C.UTF-8

USER root

RUN apt-get update \
    && echo "Updated apt-get" \
    && apt-get install -y openjdk-8-jre \
    && echo "Installed openjdk 8"

RUN pip install --upgrade pip

# install scikit-learn with dependencies - modified from: https://hub.docker.com/r/mubo/sklearn/~/dockerfile/
RUN apt-get update && \
apt-get install -y pkg-config libopenblas-dev liblapack-dev build-essential gfortran python-dev libfreetype6-dev libjpeg-dev libhdf5-dev liblzo2-dev libbz2-dev && \
pip install cython && \
pip install numpy==1.19.5 && \
pip install six && \
pip install scipy && \
pip install scikit-learn==1.0.2

RUN pip install pandas-datareader && \
    pip install pandas==1.3.5 && \
    pip install matplotlib && \
    pip install joblib==1.1.0 && \
    pip install matplotlib==3.2.2 && \
    pip install seaborn

USER $NB_UID 

VOLUME ["/works"]

WORKDIR /works

ENV JUPYTER_ENABLE_LAB=yes

