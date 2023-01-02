#!/bin/bash

dirpath=$(pwd)
py -m venv venv
source venv/bin/activate
pi install --upgrade pip
pi install autopep8

