#!/usr/bin/env bash

# Stop and remove all containers
echo "Stopping and removing containers..."
docker stop $(docker ps -aq) >/dev/null 2>&1
docker rm $(docker ps -aq) >/dev/null 2>&1

# Remove all images
echo "Removing images..."
docker rmi $(docker images -aq) >/dev/null 2>&1

# Remove all volumes
echo "Removing volumes..."
docker volume rm $(docker volume ls -q) >/dev/null 2>&1

# Remove all networks
echo "Removing networks..."
docker network rm $(docker network ls -q) >/dev/null 2>&1

echo "Removing everything..."
docker system prune --all --volumes --force

echo "Docker cleanup completed."