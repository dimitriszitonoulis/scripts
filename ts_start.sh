#!/bin/sh

sudo systemctl start tailscaled.service && \
sudo tailscale up && \
sudo tailscale status
