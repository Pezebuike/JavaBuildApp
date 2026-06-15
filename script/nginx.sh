#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

sudo -E apt-get update -y
sudo -E apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  nginx

sudo systemctl enable nginx 2>&1
sudo systemctl start nginx 2>&1
