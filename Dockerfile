FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
      git \
      curl \
      python3-pip \
      python3 && \
      pip3 install pre-commit \
      && mkdir /pre-commit && \
      cd /pre-commit

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash \
      && mv /kustomize /usr/bin/kustomize

WORKDIR /pre-commit

CMD ["pre-commit", "run", "--all-files"]
