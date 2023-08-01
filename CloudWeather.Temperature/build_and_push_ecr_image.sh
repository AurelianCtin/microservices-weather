#!/bin/bash
set -e

aws ecr get-login-password --region eu-central-1 --profile weather-ecr-agent | docker login --username AWS --password-stdin 207700462595.dkr.ecr.eu-central-1.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-temperature:latest .
docker tag cloud-weather-temperature:latest 207700462595.dkr.ecr.eu-central-1.amazonaws.com/cloud-weather-temperature:latest
docker push 207700462595.dkr.ecr.eu-central-1.amazonaws.com/cloud-weather-temperature:latest



