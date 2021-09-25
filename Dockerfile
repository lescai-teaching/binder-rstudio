FROM ghcr.io/lescai-teaching/rstudio-docker-amd64:latest@sha256:96fbb7698a8b3097c167715153808f5c284cd58502736ff7ea117de5a7110a95

RUN pip install --no-cache-dir notebook
RUN pip install --no-cache-dir jupyterhub

ARG NB_USER=rstudio
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}