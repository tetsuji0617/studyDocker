FROM ubuntu:latest
MAINTAINER pedalclecle <pedalclecle@gmail.com>
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo
RUN apt-get update && \
    apt-get -y upgrade
RUN apt-get autoclean
RUN apt-get install -y apache2
CMD service apache2 start

