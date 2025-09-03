#!/bin/bash

# Install the plugin in editable mode
pip install --no-deps --editable /app/nomad/plugins/nomad-forematics

python -m celery -A nomad.processing worker -B -l info  -Q celery
