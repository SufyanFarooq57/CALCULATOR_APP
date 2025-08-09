#!/bin/bash

# Go to deployment directory
cd /home/ubuntu/CALCULATOR_APP

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Kill any running app.py process
pkill -f "python3 app.py" || true

# Start app in background
nohup python3 app.py > app.log 2>&1 &
