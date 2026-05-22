FROM ghcr.io/navikt/pdfgenrs:0.1.61

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts
ENV DEV_MODE=true #remove when in prod
