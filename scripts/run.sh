#!/bin/bash

# # Set the PYTHONPATH to prioritize the local plugin directory
# export PYTHONPATH=/app/nomad/plugins:$PYTHONPATH

# # Install the plugin in editable mode (optional step if needed)
# pip install --no-deps --editable /app/nomad/plugins/nomad-forematics
echo ">>> Starting run.sh"
echo "Installing local nomad-forematics plugin..."
pip uninstall -y nomad-forematics || true
pip install --no-deps --editable /app/nomad/plugins/nomad-forematics
pip show nomad-forematics

# Run NOMAD as before
python -m nomad.cli admin run app --with-gui --gunicorn --host 0.0.0.0 $@
