#!/usr/bin/bash

# Kubectl
sudo rm /etc/yum.repos.d/kubernetes.repo

# Docker
sudo rm /etc/yum.repos.d/docker-ce.repo

# 1password
sudo rm /etc/yum.repos.d/1password.repo

# rpm fusion nonfree
sudo dnf remove -y "*nonfree*"