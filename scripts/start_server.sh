#!/bin/bash

set -euo pipefail

./manage.py migrate
./manage.py seed

# parse optional command line arguments here
# e.g. --dev for development mode
# e.g. --prod for production mode
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --dev)
            echo "Running in development mode"
            ./manage.py runserver 0.0.0.0:8000
            sqlite_web \
                --host 0.0.0.0 \
                --port 8001 \
                db.sqlite3 &
            ;;
        --prod)
            echo "Running in production mode"
            ./manage.py runserver 0.0.0.0:4000
            ;;
        *)
            echo "Unknown option: $key"
            exit 1
            ;;
    esac
done
