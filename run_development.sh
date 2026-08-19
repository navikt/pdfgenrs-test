#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDFGENRS_IMAGE="$(grep '^FROM ' "$CURRENT_PATH/Dockerfile" | head -n 1 | awk '{print $2}')"
PDFGENRS_PLATFORM="${PDFGENRS_PLATFORM:-linux/amd64}"

docker pull "$PDFGENRS_IMAGE"
docker run \
        --platform "$PDFGENRS_PLATFORM" \
        -v $CURRENT_PATH/templates:/app/templates \
        -v $CURRENT_PATH/data:/app/data \
        -v $CURRENT_PATH/fonts:/app/fonts \
        -v $CURRENT_PATH/resources:/app/resources \
        -p 8080:8080 \
        -e DEV_MODE=true \
        -it \
        --rm \
        "$PDFGENRS_IMAGE"
