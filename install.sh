#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Dectomon Installer ==="
echo ""

# Check prerequisites
echo "Checking prerequisites..."

if ! command -v docker &>/dev/null; then
    echo "Error: Docker is not installed. Install it from https://docs.docker.com/get-docker/"
    exit 1
fi

if ! docker compose version &>/dev/null; then
    echo "Error: Docker Compose is not available. Install it from https://docs.docker.com/compose/install/"
    exit 1
fi

if ! docker info &>/dev/null 2>&1; then
    echo "Error: Docker daemon is not running. Start Docker and try again."
    exit 1
fi

echo "  Docker: $(docker --version)"
echo "  Compose: $(docker compose version)"
echo ""

# Build the image
echo "Building Dectomon Docker image..."
docker compose -f "$SCRIPT_DIR/docker-compose.yml" build
echo ""

# Install the CLI command
echo "Installing dectomon command to /usr/local/bin/..."

# Write a wrapper script that points back to this repo's docker-compose.yml
sudo tee /usr/local/bin/dectomon > /dev/null <<EOF
#!/usr/bin/env bash
set -euo pipefail

COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"

if ! docker ps --format '{{.Names}}' | grep -q '^dectomon\$'; then
    echo "Starting Dectomon..."
    docker compose -f "\$COMPOSE_FILE" up -d
    echo "Waiting for Dectomon to start..."
    sleep 2
else
    echo "Dectomon is already running."
fi

echo "Opening dashboard at http://localhost:61208"
xdg-open "http://localhost:61208" 2>/dev/null || echo "Visit http://localhost:61208 in your browser."
EOF
sudo chmod +x /usr/local/bin/dectomon

echo ""
echo "=== Installation complete ==="
echo "Run 'dectomon' to start the system monitor dashboard."
