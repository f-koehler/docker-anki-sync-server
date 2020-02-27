#!/bin/bas
set -euf -o pipefail

cd /app/server
python utils/migrate_user_tables.py

python -m ankisyncd
