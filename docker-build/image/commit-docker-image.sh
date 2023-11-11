#!/bin/bash

script_dir=$(dirname "$0")
yaml_file="$script_dir/docker-compose-template.yml"
IMAGE_NAME=$(awk '/^ *image:/ {sub(/^ *image: */, ""); sub(/ *$/, ""); print $0}' "$yaml_file")

CONTAINER_NAME=$(awk -F= '/^ *- CONTAINER_NAME=/ {gsub(/ /,"",$2); print $2}' "$yaml_file")

docker tag ${CONTAINER_NAME} ${IMAGE_NAME}
docker push "${IMAGE_NAME}"