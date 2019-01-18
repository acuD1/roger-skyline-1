#!/bin/bash
ansible-playbook -i ~/roger-skyline-1/Ansible/hosts ~/roger-skyline-1/Ansible/rs1-setup.yml \
	--user=arsciand --extra-vars "ansible_sudo_pass=1319"
