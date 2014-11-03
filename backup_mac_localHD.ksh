#This file will backup directories to local backup drive.

# make sure the external HD is connected

#variables
backupdir=/Volumes/BackupHD/backup

now=`date +'%m-%d-%Y'`

echo $now
#Directory Array


# Main Loop
#mkdir -p $backupdir/$now   #No longer using folder / date format
for name in Applications Library Network System Users/jjenkins etc home opt usr
do
echo "Attempting to backup $name"
sudo rsync -zav /$name $backupdir
echo "Done backing up $name, moving on"
done
#Put a date stamp to show latest backup
sudo touch $backupdir/$now.txt

#Delete backuped trash file
rm -rf /Volumes/BackupHD/backup/jjenkins/.Trash/*

