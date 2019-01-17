#!/bin/bash
# Used iso : mini.iso (netboot) ubuntu 18.04
# This script is executed post install. Make sure to have roger-skyline-1.git on your home folder
# by executing git.sh
# >>>> git.sh
# sudo apt update -y && sudo apt upgrade -y
# sudo apt install git -y
# git clone https://github.com/acuD1/roger-skyline-1.git
# =====
#
# Initialisation for deployment
sudo apt update -y && sudo apt upgrade -y
sudo apt install vim ccze python3.6 python-pip -y
sudo pip install -U virtualenv
cd ~/
mkdir ansible-play
cd ~/ansible-play
virtualenv .venv
source .venv/bin/activate
pip install ansible
cd ~/roger-skyline-1/Ansible
source ~/ansible-play/.venv/bin/activate
ansible-playbook -i ./hosts rs1-setup.yml
