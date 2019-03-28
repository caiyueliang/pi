FROM ubuntu:18.04

MAINTAINER "lijinchao"<lijinchao2007@163.com>

ENV TZ=Asia/Shanghai
RUN echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get autoclean

RUN apt-get -qq update
RUN apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=2 \
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

# ENV PATH /opt/conda/bin:$PATH


