FROM debian:stable-slim

ARG PRE_COMMIT_VERSION=2.13.0

RUN apt-get update \
      && apt-get install -y \
      --no-install-recommends \
      git \
      curl \
      ca-certificates \
      python3 \
      && mkdir /pre-commit \
      && rm -rf /var/cache/apt/archives

RUN  curl -sL \
      https://github.com/pre-commit/pre-commit/releases/download/v$PRE_COMMIT_VERSION/pre-commit-$PRE_COMMIT_VERSION.pyz \
      -o /usr/bin/pre-commit.pyz

RUN curl -s \
      "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" \
      | bash \
      && mv /kustomize /usr/bin/kustomize

WORKDIR /pre-commit

CMD ["python3 /pre-commit/pre-commit.pyz", "run", "--all-files"]
