#!/bin/bash

# A simple script to backup database and web application files
# /etc/crontab:
# 30 4 * * * root /home/foo/bin/backup-demo.sh

dbfile="/tmp/sql.gz"
mysqldump -u root -ppassword --single-transaction exampledb | gzip -c > $dbfile

htmlfile="/tmp/html.tar.gz"
tar czf $htmlfile -C /var/www/html/myapp .