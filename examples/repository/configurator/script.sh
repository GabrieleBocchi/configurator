#!/usr/bin/env sh

set -e

apk add --update --no-cache -t ansible

ansible-galaxy collection install -U community.docker

mkdir -p /root/.ssh
ssh-keyscan -t rsa github.com >/root/.ssh/known_hosts
printf "Host *.example.org\n\tStrictHostKeyChecking no" >/root/.ssh/config
