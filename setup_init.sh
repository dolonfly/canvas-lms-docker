#!/bin/bash
docker compose -f docker-compose.yml -f docker-compose.canvas.yml -p canvas-lms run --rm web sh /home/app/canvas/script/prod-db-initial.sh