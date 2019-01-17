#!/bin/bash
source ~/ansible-play/.venv/bin/activate
ansible-playbook -i ./hosts ~/roger-skyline-1/Ansible/rs1-setup.yml
