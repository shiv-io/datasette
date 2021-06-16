# About

This project uses GitHub Actions to deploy a [datasette](https://datasette.io) website that comes with a UI for exploring data and a JSON API. The underlying data can be found in the `data/` directory.

The project is deployed on Google Cloud Run and is available [here](https://datasette-service-k3pyevlkcq-el.a.run.app/).

[![Datasette build](https://github.com/shiv-io/Kansas-City-Housing-Data/actions/workflows/publish.yml/badge.svg)](https://github.com/shiv-io/Kansas-City-Housing-Data/actions/workflows/publish.yml)

## Attribution

The [GitHub Action workflow](./.github/workflows/publish.yml) that deploys the Datasette instance is adapted from [simonw/covid-19-datasette](https://github.com/simonw/covid-19-datasette).

# Getting Started

### Install dependencies

```
pip install datasette
pip install sqlite-utils
```

### Create a sqlite database and import CSV

```
sqlite-utils insert app.db house_sales kc_house_data.csv --sniff
```

### Publish locally

```
datasette serve
```

### Publish to Google Cloud

To publish to Google Cloud, we'll need to [install GCloud SDK](https://cloud.google.com/sdk/docs/downloads-versioned-archives). After installation and setup, follow the instructions below.

Create Google Cloud project:

```
gcloud projects create datasette-publisher
gcloud init --skip-diagnostics --project=datasette-publisher
```

Publish:

```
datasette publish cloudrun app.db
```
