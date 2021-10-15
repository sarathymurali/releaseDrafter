FROM node:14-slim

ENV NO_UPDATE_NOTIFIER=true

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y bash git curl openssh-client coreutils docker-ce docker-ce-cli containerd.io

ENV HOME=/home/node
RUN adduser node root && \
    chown node:root $HOME && \
    chmod g=u $HOME
WORKDIR $HOME
USER 1000:0

RUN mkdir -p .ssh && \
    ssh-keyscan -t rsa github.com >> ./.ssh/known_hosts && \
    git config --global user.email jenkins@appdirect.com && \
    git config --global user.name 'Jenkins'
