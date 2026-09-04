FROM ghcr.io/navikt/pdfgenrs:1.0.33

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts
