#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDFGENRS_IMAGE="${PDFGENRS_IMAGE:-ghcr.io/navikt/pdfgenrs:1.0.23}"
PDFGENRS_PLATFORM="${PDFGENRS_PLATFORM:-linux/amd64}"

docker pull "$PDFGENRS_IMAGE"
docker run \
        --platform "$PDFGENRS_PLATFORM" \
        --mount type=bind,src="$CURRENT_PATH/templates",dst=/app/templates \
        --mount type=bind,src="$CURRENT_PATH/data",dst=/app/data \
        --mount type=bind,src="$CURRENT_PATH/fonts",dst=/app/fonts \
        --mount type=bind,src="$CURRENT_PATH/resources",dst=/app/resources \
        -p 8080:8080 \
        -e DEV_MODE=true \
        -it \
        --rm \
        "$PDFGENRS_IMAGE"
