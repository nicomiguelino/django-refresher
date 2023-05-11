# A refresher on Django

## Overview

It's been a while since I've touched Django code. It's time to do a refresher.
We will be playing around with Django 3.2 in a Dockerized environment.

## Environment setup

### Development

Run the following commands to get the development server up and running:

```bash
docker compose -f docker-compose.dev.yml build
docker compose -f docker-compose.dev.yml up -d
```

Take note that all data will be wiped out if you rebuild and restart the containers.

With the development server up and running, you can access the following from your browser:

- Django development server &ndash; `http://localhost:8000`
- [Web-based SQLite3 database browser][1] &ndash; `http://localhost:8001`

### Production

Run the following commands to get the production server up and running:

```bash
docker compose build
docker compose up -d
```

Get into the web container using `bash`:

```bash
docker compose exec dr-web bash
```

Run the following command to populate the database with preset data:

```bash
# You only need to run this command once.
# This is a one-time setup.
./manage.py seed
```



[1]: https://github.com/coleifer/sqlite-web
