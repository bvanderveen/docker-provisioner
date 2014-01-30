# ipx core kvm provisioning
set -x

sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

sudo apt-get update
sudo apt-get -y install linux-image-extra-`uname -r`
sudo apt-get -y install lxc-docker

sudo sh -c "echo \"DOCKER_OPTS=\\\"-H unix:///var/run/docker.sock -H tcp://127.0.0.1:4243\\\"\" >> /etc/default/docker"

sudo service docker restart
