#!/bin/bash
# Initialisation for deployment
sudo apt update -y && sudo apt upgrade -y
sudo apt install vim ccze python3.6 python-pip -y
sudo pip install -U virtualenv
cd ~/
mkdir ansible-play
cd ansible-play
virtualenv .venv
source .venv/bin/activate
pip install ansible
