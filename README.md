# docker-provisioner

This is a dumb-dumb script I cobbled together to provision an IPXCore KVM (Ubuntu 13.10 x64) to run Docker containers. It'll probably work in a lot of other contexts. 

# Requirements

You have root access to a running VM somewhere.

# Basic idea:

Connects to a bare VM and installs Docker on it.

- Connect to host, create user account, upload SSH keys, upload a script (which performs the remainder of the provisioning)
- Install and run Docker, bind Remote API to loopback port
- Use SSH tunnelling to talk to Docker daemon on the newly provisioned box.

Now you can run Docker containers on a VM. Go crazy.

# Details

Do these things:

- Provision the VM:
  
  `$ HOST=<host> provision.sh`
  
- Create an SSH tunnel to the inner Docker daemon:
  
  `ssh -L 4243:<host>:4243`
  
- Now you can run containers remotely:
  
  `DOCKER_HOST=<host> docker run …`


# VM provisioning details

Provisioning create an account for you (sudoer, NOPASSWD) and add your public key to `authorized_keys` on the base VM. Then it copys and runs `provision_box.sh` as you to install and run the Docker daemon.



