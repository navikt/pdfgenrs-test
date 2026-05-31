FROM ghcr.io/navikt/pdfgenrs:0.1.73

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts
COPY oxifmt/typst-oxifmt-1.0.0 /app/oxifmt
ENV DEV_MODE=true 
#remove DEV_MODE=true when in prod
