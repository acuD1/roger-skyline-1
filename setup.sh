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
sudo apt -o Acquire::Check-Valid-Until=false update -y && sudo apt upgrade -y
sudo apt install vim ccze ansible -y
ansible-playbook -i ~/roger-skyline-1/Ansible/hosts ~/roger-skyline-1/Ansible/rs1-setup.yml \
	--user=arsciand --extra-vars "ansible_sudo_pass=1319"
