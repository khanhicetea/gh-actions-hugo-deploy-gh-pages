FROM alpine:latest

LABEL "com.github.actions.name"="Hugo for GitHub Pages"
LABEL "com.github.actions.description"="Builds and deploys the project to GitHub Pages"
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/khanhicetea/gh-actions-hugo-deploy-gh-pages"
LABEL "homepage"="https://github.com/khanhicetea/gh-actions-hugo-deploy-gh-pages"
LABEL "maintainer"="KhanhIceTea <khanhicetea@gmail.com>"

LABEL "Name"="Hugo for GitHub Pages"
LABEL "Version"="0.1.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV HUGO_VERSION 0.54

RUN wget -O /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz &&\
    tar -zxf /tmp/hugo.tar.gz -C /tmp &&\
    mv /tmp/hugo /usr/local/bin/hugo &&\
    rm /tmp/* &&\
    apk add --no-cache --no-document \
        git \
        openssh-client

COPY entrypoint.sh /entrypoint.sh
