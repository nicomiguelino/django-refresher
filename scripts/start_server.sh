#!/bin/bash

set -euo pipefail

./manage.py migrate
./manage.py seed

sqlite_web \
    --host 0.0.0.0 \
    --port 8001 \
    db.sqlite3 &

./manage.py runserver 0.0.0.0:8000
