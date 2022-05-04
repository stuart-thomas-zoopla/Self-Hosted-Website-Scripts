#!/bin/bash
sudo mount -a
month=`date +"%b-%Y"`
filesToBackup=`/var/www`
destinationForBackup=`/mnt/wordpress/`+$month
/usr/bin/rsync -ru $filesToBackup $destinationForBackup

sqlBackupLocation=`/mnt/database/`+$month.sql
mysqldump --all-databases --user=pi --password=Relisys358641 --result-file=$sqlBackupLocation

