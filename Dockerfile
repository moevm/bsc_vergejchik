FROM ubuntu:xenial as openedx
FROM cranphin/iverilog

RUN apt update && \
  apt install -y git-core language-pack-en apparmor apparmor-utils python python-pip python-dev && \
  pip install --upgrade pip setuptools && \
  rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /iverilog

COPY xqueue-watcher /iverilog/xqueue-watcher
COPY tasks tasks/
COPY check.sh .

RUN pip install -r xqueue-watcher/requirements/production.txt

CMD cd xqueue-watcher && python -m xqueue_watcher -d conf.d/
