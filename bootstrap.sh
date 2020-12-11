#!/bin/bash
set -e

# Remove a potential pre-existing pid file for the rails.
rm -f /app/tmp/pids/server.pid

# Then execute the main process declared in Dockerfile as CMD.
exec "$@"