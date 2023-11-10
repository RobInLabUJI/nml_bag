FROM ros:humble-ros-base

RUN apt-get update && apt-get install -y \
      python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install notebook matplotlib

ENV SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

EXPOSE 8888

USER ${NB_USER}

WORKDIR ${HOME}

ADD --chown=${NB_USER}:${NB_USER} . .

RUN python3 -m pip install .

WORKDIR ${HOME}

CMD ["jupyter", "notebook", "--no-browser", \
     "--ip", "0.0.0.0", "--NotebookApp.token=''"]

