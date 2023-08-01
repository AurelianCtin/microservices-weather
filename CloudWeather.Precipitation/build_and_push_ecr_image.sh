#!/bin/bash
set -e

aws ecr get-login-password --region eu-central-1 --profile weather-ecr-agent | docker login --username AWS --password-stdin 207700462595.dkr.ecr.eu-central-1.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-precipitation:latest .
docker tag cloud-weather-precipitation:latest 207700462595.dkr.ecr.eu-central-1.amazonaws.com/cloud-weather-precipitation:latest
docker push 207700462595.dkr.ecr.eu-central-1.amazonaws.com/cloud-weather-precipitation:latest



