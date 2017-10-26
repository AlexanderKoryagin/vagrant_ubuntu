Create Ubuntu 16.04 LTS virtual machine with Vagrant and VirtualBox.
```
Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
Install VirtualBox Extension Pack
Install Vagrant: https://www.vagrantup.com/downloads.html
Open CMD:

set HTTP_PROXY=http://192.168.50.77:8080/    # for bash: export HTTP_PROXY=http://192.168.50.77:8080/
set HTTPS_PROXY=http://192.168.50.77:8080/   # for bash: export HTTP_PROXY=http://192.168.50.77:8080/

vagrant plugin install vagrant-disksize  # vagrant plugin update vagrant-disksize
vagrant up                               # vagrant up --provision ; vagrant reload --provision

vagrant halt          # To stop VM
vagrant destroy -f    # To destroy VM
```
