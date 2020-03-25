FROM cranphin/iverilog

WORKDIR /usr/src/iverilog

COPY tasks tasks/

COPY solutions solutions/

COPY check.sh .