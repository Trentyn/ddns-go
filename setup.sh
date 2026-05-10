#!/bin/bash

set -e

echo "[1/4] Installing curl..."
apt install -y curl

echo "[2/4] Installing Docker..."
curl -fsSL https://get.docker.com | sh

echo "[3/4] Adding $USER to docker group..."
usermod -aG docker $USER

echo "[4/4] Starting ddns-go..."
docker compose up -d

IP=$(hostname -I | awk '{print $1}')
echo ""
echo "✓ Done! Web panel: http://$IP:9876"
