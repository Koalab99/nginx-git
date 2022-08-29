#!/bin/ash

USERNAME=$GIT_USERNAME
PASSWORD=$GIT_PASSWORD
REPOSITORY=$GIT_REPOSITORY
BRANCH=$GIT_BRANCH
HTML_DIR="/usr/share/nginx/html"

mkdir -p /git
cd /git

git clone https://$USERNAME:$PASSWORD@$REPOSITORY .
git fetch origin $BRANCH --depth=1
git checkout $BRANCH

rm -r "$HTML_DIR"/*
mv -f ./* "$HTML_DIR"
chown -R nginx:nginx "$HTML_DIR"

# run
nginx -g 'daemon off;'
