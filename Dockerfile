FROM ghcr.io/navikt/pdfgenrs:0.1.41

COPY templates /app/templates
COPY resources /app/resources
COPY resources /app/templates/resources
ENV DEV_MODE=true
