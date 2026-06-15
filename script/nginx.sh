#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

# Remove command-not-found to prevent apt-get update post-invoke failure on Ubuntu 20.04
sudo apt-get remove -y --purge command-not-found 2>/dev/null || true
sudo rm -f /usr/lib/cnf-update-db

sudo -E apt-get update -y
sudo -E apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  nginx

sudo systemctl enable nginx 2>&1
sudo systemctl start nginx 2>&1
