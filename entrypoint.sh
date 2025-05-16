#!/usr/bin/env bash
set -e

if [ ! -f .env ] && [ -f .env.example ]; then
  cp .env.example .env
  echo "Generated .env; please edit with real credentials."
  exit 1
fi

if [ -z "$WALLET_PRIVATE_KEY" ]; then
  echo "ERROR: WALLET_PRIVATE_KEY not set."
  exit 1
fi

exec uvicorn app.main:app --host 0.0.0.0 --port "${PORT:-8000}"
