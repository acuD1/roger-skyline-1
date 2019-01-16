#!/bin/bash
date |& tee -a /var/log/update_script.log && \
	apt-get update |& tee -a /var/log/update_script.log && \
	apt-get upgrade |& tee -a /var/log/update_script.log && \
	echo -e "\n" |& tee -a /var/log/update_script.log
