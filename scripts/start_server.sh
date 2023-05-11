#!/bin/bash

set -euo pipefail

./manage.py migrate

# parse optional command line arguments here
# e.g. --dev for development mode
# e.g. --prod for production mode
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --dev)
            echo "Running in development mode"
            sqlite_web \
                --host 0.0.0.0 \
                --port 8001 \
                db.sqlite3 &
            ./manage.py seed
            ./manage.py runserver 0.0.0.0:8000
            ;;
        --prod)
            echo "Running in production mode"
            ./manage.py collectstatic --noinput --clear
            gunicorn django_refresher.wsgi:application \
                --bind 0.0.0.0:4000
            ;;
        *)
            echo "Unknown option: $key"
            exit 1
            ;;
    esac
done
