FROM ghcr.io/navikt/pdfgenrs:0.1.50

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
ENV DEV_MODE=true
