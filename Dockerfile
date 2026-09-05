FROM ghcr.io/navikt/pdfgenrs:1.0.33 AS pdfgenrs

FROM nginx:1.29-alpine

COPY --from=pdfgenrs /app/pdfgenrs /app/pdfgenrs
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh

COPY templates /app/templates
COPY resources /app/resources
COPY data /app/data
COPY fonts /app/fonts

RUN chmod +x /start.sh

CMD ["/start.sh"]
