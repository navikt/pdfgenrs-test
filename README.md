# pdfgenrs-test

Template repository for `pdfgenrs-test`, used to generate PDFs through the pdfgenrs API.

## Technologies

- [pdfgenrs](https://github.com/navikt/pdfgenrs)
- [Docker](https://www.docker.com/)
- [Typst](https://typst.app/#start)
- [JSON](https://www.json.org/json-en.html)

## Getting started

### Docker Compose (recommended for template development)

Start the development server:

```bash
docker compose up --watch
```

This mounts your local `templates/`, `data/`, `fonts/`, and `resources/` directories into the container with `DEV_MODE=true`, so template changes are picked up automatically.

> **Note:** The `pdfgenrs` image is only published for `linux/amd64`. The compose file sets `platform: linux/amd64` so it works on arm64 hosts (e.g., Apple Silicon Mac) without extra flags.

### Run in development mode (shell script)

Alternatively, run the container directly with the provided shell script:

```bash
./run_development.sh
```
The script defaults to `linux/amd64`; set `PDFGENRS_PLATFORM` to override it for another target platform.


### Preview output locally

With `./run_development.sh` running, open:

`http://0.0.0.0:8080/api/v1/genpdf/pdfgenrs-test/pdfgenrs-test`

The container runs with `DEV_MODE=true`

> **Note:** This URL uses a GET request, which is only supported when `DEV_MODE=true`. In production, the `/api/v1/genpdf/` endpoint requires a POST request with a JSON body.

### Endpoint pattern and data structure

Use:

`/api/v1/genpdf/<application>/<template>`

The endpoint reads test data from:

`data/<application>/<template>.json`

The template and data directories both follow the `<application>/<template>` structure.

## Build image locally

```bash
docker build -t pdfgenrs-test .
```

## Upgrading the pdfgenrs image version

Update the image version in all of these files:

- `Dockerfile`: `FROM ghcr.io/navikt/pdfgenrs:<version>`
- `run_development.sh`: default value of `PDFGENRS_IMAGE`
- `.github/workflows/test.yml`: job `env.PDFGENRS_IMAGE`

## Live preview endpoints

- https://pdfgenrs-test.ansatt.dev.nav.no/api/v1/genpdf/pdfgenrs-test/pdfgenrs-test
- https://pdfgenrs-test.ansatt.dev.nav.no/api/v1/genhtml/pdfgenrs-test/pdfgenrs-test

## Contact

Maintained by [navikt/pdfgen](CODEOWNERS).

Questions or feature requests: open an [issue](https://github.com/navikt/pdfgenrs-test/issues).

If you work in [@navikt](https://github.com/navikt), contact us in Slack: `#pdfgen`.
