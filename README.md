The data can be viewed [here](https://datasette-service-k3pyevlkcq-el.a.run.app/).

[![Datasette build](https://github.com/shiv-io/Kansas-City-Housing-Data/actions/workflows/publish.yml/badge.svg)](https://github.com/shiv-io/Kansas-City-Housing-Data/actions/workflows/publish.yml)

## Getting Started

```
pip install datasette
pip install sqlite-utils
```

Create a db and import CSV:

```
sqlite-utils insert app.db house_sales kc_house_data.csv --sniff
```

Serve:

```
datasette serve
```

To publish, we'll need to [install GCloud SDK](https://cloud.google.com/sdk/docs/downloads-versioned-archives). 

Install GCloud SDK:

```
./google-cloud-sdk/install.sh
```

Create GCloud project:

```
gcloud projects create datasette-publisher
gcloud init --skip-diagnostics --project=datasette-publisher
```

Publish:

```
datasette publish cloudrun app.db
```