#!/usr/bin/env sh
set -e

# If the user mounted real .env, keep it; otherwise use our example
if [ -f /.env ]; then
  echo "Using mounted .env"
elif [ -f .env ]; then
  echo "Using built-in .env"
else
  echo "Generating .env from .env.example"
  cp .env.example .env
fi

# Launch FastAPI (which in turn starts your poller in background)
exec uvicorn app.main:app      --host 0.0.0.0      --port ${PORT:-8000}
