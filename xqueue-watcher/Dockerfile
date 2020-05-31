FROM ubuntu:xenial as openedx

RUN apt update && \
  apt install -y git-core language-pack-en apparmor apparmor-utils python python-pip python-dev && \
  pip install --upgrade pip setuptools && \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /iverilog
COPY /xqueue_watcher/. /iverolog/xqueue_watcher
# RUN pip install -r xqueue-watcher/requirements/production.txt

# CMD python -m xqueue-watcher/xqueue_watcher -d xqueue-watcher/conf.d/



FROM cranphin/iverilog

COPY tasks tasks/

COPY check.sh .
