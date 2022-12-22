#!/bin/sh

mkdir -p /etc/ssh/keys
cp /mnt/keys/authorized_keys /etc/ssh/keys/authorized_keys
cp /mnt/keys/ssh_host_rsa_key /etc/ssh/keys/ssh_host_rsa_key

chmod 755 /etc/ssh/keys
chmod 644 /etc/ssh/keys/authorized_keys
chmod 600 /etc/ssh/keys/ssh_host_rsa_key

GIT_USERNAME="`cat /mnt/keys/git_username`"
GIT_PASSWORD="`cat /mnt/keys/git_password`"

git config --global init.defaultBranch "main"
htpasswd -b -c /srv/git/.htpasswd "$GIT_USERNAME" "$GIT_PASSWORD"

chown git:git -R /srv/git
chown git:git -R /var/lib/nginx

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf