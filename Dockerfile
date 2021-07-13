FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
      git \
      python3-pip \
      python3 && \
      pip3 install pre-commit \
      && mkdir /pre-commit && \
      cd /pre-commit

WORKDIR /pre-commit

CMD ["pre-commit", "run", "--all-files"]
