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

# ==========================================================================================================
# 安装gcc, g++
RUN apt-get -qq update
# RUN apt-get -qq -y install gcc
# RUN apt-get -qq -y install g++

# requirements.txt 在build.sh中会复制过来
COPY requirements.txt /requirements.txt

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r /requirements.txt

RUN apt-get -qq -y install libgtk2.0-dev build-essential libboost-all-dev cmake libsm6 libxext6 libfontconfig1 libxrender1

# conda 安装必要的库
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
# RUN conda install mysql-python=1.2.5
# RUN conda install keras=2.2.0
# RUN conda install tensorflow=1.10.0
RUN conda install pytorch-cpu=0.4.0
RUN conda install torchvision-cpu=0.2.1
# RUN conda install pillow=5.2.0

# ==========================================================================================================
# redis 安装
# RUN pip install redis==3.2.0

# ==========================================================================================================
RUN rm -fr ~/.cache/pip \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log 

# ==========================================================================================================
COPY ./* /Faceboxes

WORKDIR /Faceboxes

CMD ["python", "predict.py"]
# CMD ["python", "manage.py", "runserver", "--noreload", "--nothreading", "--settings=lpr.settings_docker_dev", "0.0.0.0:9501"]
