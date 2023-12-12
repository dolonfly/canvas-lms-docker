#!/bin/bash
docker compose -f docker-compose.yml -f docker-compose.canvas.yml -p canvas-lms down # --rmi all