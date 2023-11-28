#!/bin/bash
docker compose -f docker-compose.yml.sample -f docker-compose.canvas.yml -p canvas-lms up -d
#docker compose -f docker-compose.yml -f docker-compose.canvas.yml -p canvas-lms up