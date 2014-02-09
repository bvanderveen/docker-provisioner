set -x

ssh root@$HOST "adduser --disabled-password --ingroup sudo --shell /bin/bash --gecos \"\" $USER; mkdir /home/$USER/.ssh; echo \"%sudo ALL=NOPASSWD: ALL\" > /etc/sudoers.d/nopasswd"
scp ~/.ssh/id_rsa.pub root@$HOST:/home/$USER/.ssh/authorized_keys

scp provision_box.sh $HOST:/home/$USER/provision_box.sh
ssh $HOST /home/$USER/provision_box.sh