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
