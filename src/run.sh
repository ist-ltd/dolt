#!/bin/sh

mkdir -p /etc/ssh/keys
cp /mnt/keys/authorized_keys /etc/ssh/keys/authorized_keys
cp /mnt/keys/ssh_host_rsa_key /etc/ssh/keys/ssh_host_rsa_key

chmod 755 /etc/ssh/keys
chmod 644 /etc/ssh/keys/authorized_keys
chmod 600 /etc/ssh/keys/ssh_host_rsa_key

chown git:git -R /srv/git

/usr/sbin/sshd -De