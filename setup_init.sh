#!/bin/bash
docker compose -f docker-compose.yml -f docker-compose.canvas.yml -p canvas-lms run --rm web sh /opt/canvas/prod-db-initial.sh