set HTTP_PROXY=http://192.168.50.77:8080/
set HTTPS_PROXY=http://192.168.50.77:8080/

vagrant up  ||  vagrant up --provision
vagrant reload --provision

vagrant halt
vagrant destroy -f
