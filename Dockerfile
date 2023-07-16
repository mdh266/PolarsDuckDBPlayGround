FROM jupyter/base-notebook:python-3.10

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    git \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    unzip \
    vim \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER $NB_UID

RUN fix-permissions /home/$NB_USER

WORKDIR /home/$NB_USER/

RUN git config --global user.email "mdh266@gmail.com" && \
    git config --global user.name "Mike Harmon" 

COPY requirements.txt /home/$NB_USER/ 

RUN pip install -r /home/$NB_USER/requirements.txt
    
USER root

USER $NB_UID