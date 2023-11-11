#!/bin/bash

IMAGE_NAME=pudding/docker-app:docker-app-archive-7-zip_app-20231111-1040-0

docker tag docker-app-archive-7-zip_app ${IMAGE_NAME}
docker push "${IMAGE_NAME}"