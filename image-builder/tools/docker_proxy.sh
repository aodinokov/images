#!/bin/bash

if [ ! -f /etc/systemd/system/docker.service.d/http-proxy.conf ]; then
  sudo mkdir -p /etc/systemd/system/docker.service.d
  sudo sh -c 'echo "[Service]" > /etc/systemd/system/docker.service.d/http-proxy.conf'
  sudo sh -c "echo \"Environment=\\\"HTTP_PROXY=http://$1/\\\"\" >> /etc/systemd/system/docker.service.d/http-proxy.conf"
  sudo sh -c "echo \"Environment=\\\"HTTPS_PROXY=http://$1/\\\"\" >> /etc/systemd/system/docker.service.d/http-proxy.conf"
  sudo systemctl daemon-reload
  sudo systemctl restart docker
fi
