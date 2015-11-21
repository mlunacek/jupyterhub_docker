FROM jupyter/jupyterhub

MAINTAINER Monte Lunacek <monte.lunacek@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install \
    vim wget

RUN pip install terminado --upgrade

RUN pip3 install terminado --upgrade


# Add default user
RUN useradd -d /home/admin -m admin; \
    echo "admin:admin" | chpasswd; \
    adduser admin sudo

# Add default user
RUN useradd -d /home/mlunacek -m mlunacek; \
    echo "mlunacek:mlunacek" | chpasswd; \
    adduser mlunacek sudo

# Start jupyterhub on boot
CMD jupyterhub -f /srv/jupyterhub/jupyterhub_config.py
