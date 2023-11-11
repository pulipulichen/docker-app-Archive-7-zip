#!/bin/bash

# 使用說明
# - 對外port必須是8000
# - 如用到目錄，必須事前建立
# - 目錄路徑必須是完整路徑

PROJECT_NAME=docker-app-Archive-7-zip
IMAGE_NAME=pudding/docker-app:docker-app-archive-7-zip_app-20231111-1040-0
LOCAL_VOLUMN_PATH=/app


LOCAL_PORT=0    # 0表示不使用
RUN_IN_BACKGROUND=false

# =================================================================

export LOCAL_PORT

echo "Image: ${IMAGE_NAME}"

mkdir -p "/content/docker-app/${PROJECT_NAME}"

# udocker --allow-root rm $(udocker --allow-root ps -m -s | awk 'NR>1 {print $1}')

if [ "$RUN_IN_BACKGROUND" = true ]; then
    echo "Run container in background.."
    nohup udocker --allow-root run -p "${LOCAL_PORT}:${LOCAL_PORT}" --volume="/content/docker-app/${PROJECT_NAME}:${LOCAL_VOLUMN_PATH}" ${IMAGE_NAME} > .nohup.out 2>&1 &
else
    echo "Run container in foreground.."
    udocker --allow-root run -p "${LOCAL_PORT}:${LOCAL_PORT}" --volume="/content/docker-app/${PROJECT_NAME}:${LOCAL_VOLUMN_PATH}" ${IMAGE_NAME}
fi
