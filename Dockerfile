FROM ghcr.io/navikt/pdfgenrs:1.0.15

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts
ENV DEV_MODE=true 
#remove DEV_MODE=true when in prod
