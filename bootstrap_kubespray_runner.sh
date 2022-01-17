#!/bin/bash

sudo apt-get update

sudo apt-get install -y mosh byobu python3-pip virtualenv

cd ./kubespray

virtualenv -p python3 venv

source venv/bin/activate

pip3 install -r requirements.txt

ansible --version