![Build status](https://github.com/navikt/pdfgenrs-test/workflows/Deploy%20to%20dev%20and%20prod/badge.svg)

# pdfgenrs-test
Repository for pdfgenrs-test templates

## Technologies & Tools

* [pdfgenrs](https://github.com/navikt/pdfgenrs)
* [Docker](https://www.docker.com/)
* [Typst](https://typst.app/#start) 
* [Json](https://www.json.org/json-en.html)

#### Creating a docker image
Creating a docker image should be as simple as
```bash
docker build -t pdfgenrs-test .
```

## Getting started
### Run in development mode
To run the application with templates, data and fonts locally mounted you can use the convenience script 
```bash 
./run_development.sh
```

When running the application you can test GET requests at
`/api/v1/genpdf/<application>/<template>` which looks for test data at `data/<application>/<template>.json` and outputs
a PDF to your browser

The template and data directory structure both follow the `<application>/<template>` structure.
Example url: `http://0.0.0.0:8080/api/v1/genpdf/pale-2/pale-2`

### Example pdf output
[pdf](pale-2.pdf)

[![Preview](pale-2-preview.png)](pale-2-preview.png)

### Local preview development 

To preview the final output with real data, keep `./run_development.sh` running in a terminal and open `http://0.0.0.0:8080/api/v1/genpdf/pale-2/pale-2` in your browser. The Docker container hot-reloads template changes automatically when `DEV_MODE=true` is set.

## When upgrading pdfgenrs docker image

Remember that the version for the docker image is in 1 places, `Dockerfile` and 2 places in `run_development.sh`,and 2 places in
`.github/workflows/test.yml`
remember to update all 6 places.


### Contact

This project is maintained by [navikt/teamsykmelding](CODEOWNERS)

Questions and/or feature requests? Please create an [issue](https://github.com/navikt/pdfgenrs-test/issues)

If you work in [@navikt](https://github.com/navikt) you can reach us at the Slack
channel [#team-sykmelding](https://nav-it.slack.com/archives/CMA3XV997)
