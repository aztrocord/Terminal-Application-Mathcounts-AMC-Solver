#!/bin/bash

if [[ -x "$(command Python3 --version)" ]]
then
    python_version="$(python -version 2>&1)" 
    if [[ $python_version == "Python3"* ]]
    then
        python3 -m venv .venv
        source ./.venv/bin/activate
        cd ./src
        pip3 install -r ./requirements.txt
        python3 main.py
    else
        echo "Your version of Python is too old. Please update it." >&2
    fi
else
    echo 'Error!
    It looks like Python is not installed! This program requires Python to run!
    To install Python, check out https://www.python.org/downloads/' >&2
    exit 1
fi