FROM nvidia/cuda:11.2.1-base

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y apt-utils curl git cmake build-essential unzip python3-pip  wget iproute2 software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.7 python3.7-dev -y
RUN python3.7 -m pip install --upgrade pip

RUN apt-get install git -y

RUN rm /usr/bin/python3
RUN ln -s //usr/bin/python3.7 /usr/bin/python3

WORKDIR /usr/app/

ADD . /usr/app/

RUN pip install --upgrade wheel

RUN pip install -r requirements.txt --no-cache-dir

CMD [ "/bin/bash" ]