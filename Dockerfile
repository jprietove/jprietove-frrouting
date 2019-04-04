# Quagga
# For use with GNS3 as a FRRouting Router
FROM debian:jessie
MAINTAINER Javier Prieto <javier.prieto.edu@juntadeandalucia.es>

LABEL Title="FFRouting" \
      Description="For use with GNS3 as a FRRouting Router"

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl apt-transport-https
RUN curl -s https://deb.frrouting.org/frr/keys.asc | apt-key add -
RUN FRRVER="frr-stable" && echo deb https://deb.frrouting.org/frr jessie $FRRVER | tee -a /etc/apt/sources.list.d/frr.list
RUN apt update && apt install -y frr frr-pythontools

COPY config/* /etc/frr/
RUN chown frr:frr /etc/frr/* && chmod 640 /etc/frr/*
RUN echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf

VOLUME [ "/etc/frr/" ]

ENTRYPOINT /etc/init.d/frr start &&  sysctl -p && bash


