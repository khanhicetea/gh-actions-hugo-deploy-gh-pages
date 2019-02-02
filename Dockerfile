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

RUN apk add --no-cache \
        git \
        openssh-client \
        libc6-compat \
        libstdc++

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
