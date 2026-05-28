FROM --platform=linux/amd64 ghcr.io/navikt/pdfgenrs:0.1.71

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts
ENV DEV_MODE=true 
#remove DEV_MODE=true when in prod
