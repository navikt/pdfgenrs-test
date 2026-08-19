#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDFGENRS_IMAGE="${PDFGENRS_IMAGE:-ghcr.io/navikt/pdfgenrs:1.0.23}"
PDFGENRS_PLATFORM="${PDFGENRS_PLATFORM:-linux/amd64}"

docker pull "$PDFGENRS_IMAGE"
docker run \
        --platform "$PDFGENRS_PLATFORM" \
        -v "$CURRENT_PATH/templates":/app/templates \
        -v "$CURRENT_PATH/data":/app/data \
        -v "$CURRENT_PATH/fonts":/app/fonts \
        -v "$CURRENT_PATH/resources":/app/resources \
        -p 8080:8080 \
        -e DEV_MODE=true \
        -it \
        --rm \
        "$PDFGENRS_IMAGE"
