#!/bin/bash
sudo mount -a
filesToBackup=`/var/www`
destinationForBackup=`/mnt/wordpress/daily`
/usr/bin/rsync -ru $filesToBackup $destinationForBackup

