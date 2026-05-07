FROM ghcr.io/navikt/pdfgenrs:0.1.41

COPY templates /app/templates
COPY resources /app/resources
COPY fonts /app/fonts
COPY data /app/data
ENV DEV_MODE=true
