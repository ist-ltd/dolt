#!/bin/sh
mkdir -p /srv/git
git config --global init.defaultBranch "main"

for REPO in $GIT_REPOS; do

    if [ ! -d "/srv/git/$REPO" ]; then
        echo "Creating git repo /srv/git/$REPO"
        git init --bare /srv/git/$REPO
        touch /srv/git/$REPO/git-daemon-export-ok
    else 
        echo "/srv/git/$REPO already exists"
    fi
done


htpasswd -b -c /srv/git/.htpasswd $GIT_USERNAME $GIT_PASSWORD

chown -R nginx /srv/git

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf