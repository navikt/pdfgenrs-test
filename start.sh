#!/bin/sh
set -eu

/app/pdfgenrs &
pdfgenrs_pid=$!

trap 'kill -TERM "$pdfgenrs_pid" 2>/dev/null; wait "$pdfgenrs_pid"; exit' INT TERM

nginx -g 'daemon off;' &
nginx_pid=$!

wait "$nginx_pid"
kill -TERM "$pdfgenrs_pid" 2>/dev/null
wait "$pdfgenrs_pid" 2>/dev/null || true
