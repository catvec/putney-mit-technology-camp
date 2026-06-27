#!/usr/bin/env bash
set -euo pipefail
readonly PROG_DIR=$(dirname $(realpath "$0"))

cd "$PROG_DIR/Raspberry-Pi-Installer-Scripts"
sudo -E env PATH=$PATH uv run ./adafruit-pitft.py \
    --display=st7789v_bonnet_240x240 \
    --rotation=0 \
    --install-type=mirror
