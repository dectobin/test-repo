# Dectomon

A minimal Dockerized system monitor that displays your host machine's performance on a web dashboard.

Built on [Glances](https://nicolargo.github.io/glances/) — monitors CPU, memory, disk, network, processes, and temperatures.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) (with Docker Compose)

## Install

```bash
git clone https://github.com/dectobin/test-repo.git && cd test-repo
chmod +x install.sh
./install.sh
```

The install script will:
1. Verify Docker and Docker Compose are installed and running
2. Build the Dectomon Docker image
3. Install the `dectomon` command to `/usr/local/bin/` (requires sudo)

## Usage

```bash
dectomon
```

This starts the monitor container and opens the dashboard in your browser at [http://localhost:61208](http://localhost:61208).

If the container is already running, it skips startup and opens the dashboard directly.

## Uninstall

From the `test-repo` directory, run:

```bash
chmod +x dectomon-remove
./dectomon-remove
```

This will:
1. Stop and remove the Dectomon container
2. Remove the Docker image
3. Remove the `dectomon` command from `/usr/local/bin/` (requires sudo)

To just stop the container without uninstalling:

```bash
docker compose -f /path/to/test-repo/docker-compose.yml down
```
