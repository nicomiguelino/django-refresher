# A refresher on Django

## Overview

It's been a while since I've touched Django code. It's time to do a refresher.
We will be playing around with Django 3.2 in a Dockerized environment.

## Development Mode

Run the following commands to get the development server up and running:

```bash
docker compose -f docker-compose.dev.yml build
docker compose -f docker-compose.dev.yml up -d
```

With the development server up and running, you can access the following from your browser:

- Django development server &ndash; `http://localhost:8000`
- [Web-based SQLite3 database browser][1] &ndash; `http://localhost:8001`



[1]: https://github.com/coleifer/sqlite-web
