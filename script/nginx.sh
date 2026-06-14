#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx 2>&1
sudo systemctl start nginx 2>&1
