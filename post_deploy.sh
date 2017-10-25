#!/bin/bash
set -x
set -u

export proxy="http://192.168.50.77:8080/"
export noproxy=""
export pycharm_ver='2017.2.3'  # https://www.jetbrains.com/pycharm/download/
export new_pwd="su"

# ------------------------------------------------------------------------- #
export http_proxy=${proxy}
export https_proxy=${proxy}
export ftp_proxy=${proxy}
export HTTP_PROXY=${proxy}
export HTTPS_PROXY=${proxy}
export FTP_PROXY=${proxy}
export NO_PROXY=${noproxy}
export no_proxy=${noproxy}

echo "Acquire::http::proxy \"${proxy}\";"   >> /etc/apt/apt.conf
echo "Acquire::ftp::proxy \"${proxy}\";"    >> /etc/apt/apt.conf
echo "Acquire::https::proxy \"${proxy}\";"  >> /etc/apt/apt.conf

echo "http_proxy=\"${proxy}\""  >> /etc/environment
echo "https_proxy=\"${proxy}\"" >> /etc/environment
echo "ftp_proxy=\"${proxy}\""   >> /etc/environment
echo "HTTP_PROXY=\"${proxy}\""  >> /etc/environment
echo "HTTPS_PROXY=\"${proxy}\"" >> /etc/environment
echo "FTP_PROXY=\"${proxy}\""   >> /etc/environment
echo "NO_PROXY=\"${noproxy}\""  >> /etc/environment
echo "no_proxy=\"${noproxy}\""  >> /etc/environment

apt-get update &&
    apt-get -y upgrade &&
    apt-get -y autoremove &&
    apt-get -y autoclean ;


# Install Ubuntu desktop
apt-get install -y ubuntu-desktop


# Install VBoxGuestAdditions
last_ver=`curl http://download.virtualbox.org/virtualbox/LATEST.TXT` # 5.2.0
wget http://download.virtualbox.org/virtualbox/${last_ver}/VBoxGuestAdditions_${last_ver}.iso
mkdir /media/iso
mount VBoxGuestAdditions_${last_ver}.iso /media/iso
cd /media/iso
yes | sudo ./VBoxLinuxAdditions.run --nox11


# Install Pycharm
apt-get install -y default-jre
wget -O /tmp/pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-${pycharm_ver}.tar.gz"
tar xfz /tmp/pycharm.tar.gz -C /opt
ln -s "/opt/pycharm-community-${pycharm_ver}/bin/pycharm.sh" /usr/bin/pycharm


# Docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88   
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
groupadd dockersu
usermod -aG docker ubuntu
# Docker proxy
mkdir -p /etc/systemd/system/docker.service.d
echo "[Service]"                            >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"HTTP_PROXY=${proxy}\""  >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"HTTPS_PROXY=${proxy}\"" >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"http_proxy=${proxy}\""  >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"https_proxy=${proxy}\"" >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"NO_PROXY=${noproxy}\""  >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment=\"no_proxy=${noproxy}\""  >> /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload && sudo systemctl restart docker

docker run hello-world


# Base Soft
apt-get install -y python-pip python-dev build-essential
apt-get install -y git vim gedit tree -y
pip install -U pip
pip install -U setuptools
pip install -U IPython ipdb virtualenv pylint


# Other
echo "alias ll='ls -alFh'" >> ~/.bashrc


# Change Password
echo "ubuntu:${new_pwd}"| sudo chpasswd







