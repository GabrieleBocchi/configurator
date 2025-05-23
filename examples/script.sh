#!/usr/bin/env sh

set -e

ansible-galaxy collection install -U community.docker

mkdir -p /root/.ssh
ssh-keyscan -t rsa github.com >/root/.ssh/known_hosts
printf "Host *.example.org\n\tStrictHostKeyChecking no" >/root/.ssh/config
