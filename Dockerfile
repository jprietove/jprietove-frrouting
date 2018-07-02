# Quagga
# For use with GNS3 as a Quagga Router
FROM ubuntu:bionic
MAINTAINER Javier Prieto <javier.prieto.edu@juntadeandalucia.es>

LABEL Title="Quagga" \
      Description="For use with GNS3 as a Quagga Router"

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y quagga

COPY config/* /etc/quagga/
RUN chown quagga:quagga /etc/quagga/* && chmod 640 /etc/quagga/*
RUN echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf

VOLUME [ "/etc/quagga" ]

ENTRYPOINT /etc/init.d/quagga start &&  sysctl -p && bash


