#!/bin/bash
# Used iso : mini.iso (netboot) ubuntu 18.04
# This script is executed post install. Before that a local script is used to install openssh-server and 
# add id_rsa.pub to the VM. Then, roger-skyline-1.git is cloned to run the deployment.
# gitclone.sh
# >>>>
# #!/bin/bash
# sudo apt update -y && sudo apt upgrade -y
# sudo apt install git openssh-server -y
# git clone https://github.com/acuD1/roger-skyline-1.git
# ====
#
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
