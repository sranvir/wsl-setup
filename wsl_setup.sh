#!/bin/sh

## WSL 2 specific things
umask 077
if [ ! -d ~/.ssh ] ; then
  cp -r /mnt/d/.ssh ~/
  chmod 600 ~/.ssh/config
  chmod 400 ~/.ssh/id*
fi

sudo cp ./snippets/wslconfig /mnt/c/Users/r/.wslconfig
sudo cp ./snippets/wsl.conf /etc/wsl.conf
sudo chmod 400 /etc/wsl.conf
sudo rm /etc/resolv.conf
echo "echo \"nameserver 1.1.1.1\" > /etc/resolv.conf" | sudo bash
## WSL 2 Specific things end here

cat ./snippets/bashrc_partials >> ~/.bashrc
sed -i 's/HOME\/bin/HOME\/.bin/g' ~/.profile
echo "echo \"$USER ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers" | sudo bash

## Ubuntu Specific stuff
sudo apt update -y
sudo apt purge show-motd update-motd snapd openssh-client openssh-server -y
sudo apt autoremove --purge -y

sudo apt upgrade -y
sudo apt autoremove --purge -y
sudo apt install curl wget rsync vim openssh-client git man-db -y
sudo apt autoremove --purge -y
sudo apt clean all
## Ubuntu specific stuff ends here

sudo fstrim /

# Making changes to SSH client config only after it is installed
sudo sed -i 's/HashKnownHosts yes/HashKnownHosts no/' /etc/ssh/ssh_config
sudo sed -i 's/#   StrictHostKeyChecking ask/\ \ \ \ StrictHostKeyChecking no/' /etc/ssh/ssh_config
exit 0
