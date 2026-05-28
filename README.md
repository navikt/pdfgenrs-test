# pdfgenrs-test

Template repository for `pdfgenrs-test`, used to generate PDFs through the pdfgenrs API.

## Technologies

- [pdfgenrs](https://github.com/navikt/pdfgenrs)
- [Docker](https://www.docker.com/)
- [Typst](https://typst.app/#start)
- [JSON](https://www.json.org/json-en.html)

## Getting started

### Run in development mode

Run the container with templates, test data, fonts, and resources mounted from your local checkout:

```bash
./run_development.sh
```

> **Note:** The `pdfgenrs` image is only published for `linux/amd64`. If you're on an arm64 host (e.g., Apple Silicon Mac), run with `--platform linux/amd64`:
>
> ```bash
> docker pull --platform linux/amd64 ghcr.io/navikt/pdfgenrs:0.1.71
> docker run --platform linux/amd64 ...
> ```

### Preview output locally

With `./run_development.sh` running, open:

`http://0.0.0.0:8080/api/v1/genpdf/pdfgenrs-test/pdfgenrs-test`

The container runs with `DEV_MODE=true`, so template changes are hot-reloaded.

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
