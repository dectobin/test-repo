#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Building Dectomon Docker image..."
docker compose -f "$SCRIPT_DIR/docker-compose.yml" build

echo "Installing dectomon command to /usr/local/bin/..."
sudo cp "$SCRIPT_DIR/dectomon" /usr/local/bin/dectomon
sudo chmod +x /usr/local/bin/dectomon

echo "Done! Run 'dectomon' to start the dashboard."
