#!/bin/bash
docker compose -f docker-compose.yml -f docker-compose.canvas.yml -p canvas-lms run --rm web bundle exec rake db:initial_setup