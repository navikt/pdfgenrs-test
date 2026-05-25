#!/bin/bash

CURRENT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDFGENRS_IMAGE="${PDFGENRS_IMAGE:-ghcr.io/navikt/pdfgenrs:0.1.65}"

docker pull "$PDFGENRS_IMAGE"
docker run \
        -v $CURRENT_PATH/templates:/app/templates \
        -v $CURRENT_PATH/data:/app/data \
        -v $CURRENT_PATH/fonts:/app/fonts \
        -v $CURRENT_PATH/resources:/app/resources \
        -v $CURRENT_PATH/resources:/app/templates/resources \
        -p 8080:8080 \
        -e DEV_MODE=true \
        -it \
        --rm \
        "$PDFGENRS_IMAGE"
