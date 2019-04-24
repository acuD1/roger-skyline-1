# roger-skyline- 1 project @ 42

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/bc9e77824aa54b4b83293789d23d093d)](https://app.codacy.com/app/acuD1/roger-skyline-1?utm_source=github.com&utm_medium=referral&utm_content=acuD1/roger-skyline-1&utm_campaign=Badge_Grade_Dashboard)

This project aims to familiarize us with the work of a sysadmin. I had to configure a linux distribution with some basics services like OpenSSH, Fail2Ban, a web server (Nginx) etc..

## Pre-requies

Thoses pre-requies are needed to work fully with Ansible for an automated deployment, otherwise you can look at ```Method 2``` and adjust your own settings.
1.  A minimal Ubuntu 18.04 LTS iso (netboot) : <http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/current/images/netboot/mini.iso>

2.  VirtualBox :
    -   Adapter 1 : ```NAT```

    -   Adapter 2 : ```Host-only Adapter``` with ```vboxnet```
        -   IPv4 : ```192.168.56.1```
        -   IPv4 Network Mask : ```255.255.255.252```
        -   DHCP Server : Disabled

3.  Installation
    -   Partition of 8GB
        -   3GB for ```/```
        -   1 GB for ```SWAP```

    -   Set username to ```arsciand```

    -   Set password to ```1319```

4.  Add the ```assets/rs1-key``` and ```assets/rs1-key.pub``` to your ```~/.ssh``` folder

5.  The passphrase for this key is ```qwerty```
## Method 1 (Fully automated deployment with Ansible)

After all the pre-requies checked, just boot your VM and runs the followings commands to install git and clone this repo
```C
sudo apt update && sudo apt upgrade -y
sudo apt install git -y
git clone https://github.com/acuD1/roger-skyline-1.git
```

Then run ```setup.sh```.
```C
./roger-skyline-1/setup.sh
```

The script will install ```vim ccze ansible``` and then execute ```rs1-playbook.yml```. This playbook will installs and configures the following roles:

-   netplan
-   openssh ```port 2222```
-   netdata
-   nginx
-   postfix
-   ufw
-   fail2ban
-   cron_script
-   parted

Each roles can be configured under ```/Ansible/roles```, or removed by simply commenting their lines in ```rs1-playbook.yml```

After the execution of the Ansible playbook, you can check the deployment by running
```C
./roger-skyline-1/rerun.sh
```

You can now open your browser at <https://192.168.56.2>, it shows Netdata

## Method 2 (By command line)

See ```tutorial.txt```
