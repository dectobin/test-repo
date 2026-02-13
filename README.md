# Dectomon

A minimal Dockerized system monitor that displays your host machine's performance on a web dashboard.

Built on [Glances](https://nicolargo.github.io/glances/) — monitors CPU, memory, disk, network, processes, and temperatures.

## Prerequisites

- Docker
- Docker Compose

## Install

```bash
git clone <repo-url> && cd test-repo
chmod +x install.sh dectomon
./install.sh
```

This builds the Docker image and copies the `dectomon` command to `/usr/local/bin/`.

## Usage

```bash
dectomon
```

This starts the container (if not already running) and opens the dashboard in your browser.

### Manual access

Visit [http://localhost:61208](http://localhost:61208) in your browser.

## Stop / Remove

```bash
docker compose down        # stop the container
docker compose down --rmi all  # stop and remove the image
```
