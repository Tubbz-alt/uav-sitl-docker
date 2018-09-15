FROM ubuntu:16.04
LABEL maintainer Evans Mantas

EXPOSE 10000-10001
EXPOSE 14550-14559

RUN apt-get update && apt-get install -y  \
  git \
  libtool-bin \
  automake \
  autoconf \
  libexpat1-dev \
  python-matplotlib \
  python-serial \
  python-wxgtk3.0 \
  python-wxtools \
  python-lxml \
  python-scipy \
  python-opencv \
  ccache \
  gawk \
  python-pip \
  python-pexpect \
  htop
RUN pip install future \
  pymavlink \
  MAVProxy \
  simplejson \
  pid \
  cherrypy \
  jinja2 \
  dronekit \
  dronekit-sitl -UI
