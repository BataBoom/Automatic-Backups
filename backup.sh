#!/bin/bash
####################################
#
# Backups
#
####################################
# What to backup. 
backup_files="/var/www/"

# Where to backup to.
dest="/home/bataboom/backups"

# Create archive filename.
day=$(date +%Y-%m-%d)
hostname=$(hostname -s)
#archive_file="$hostname-$day.tgz"
archive_file="$hostname-$day.zip"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"


# Backup the files using tar or zip.
# tar czf $dest/$archive_file $backup_files
zip -r $dest/$archive_file $backup_files -x "**/node_modules/*"


 echo "The file "$archive_file" is out for delivery..3..2..1...blast off!"
 sshpass -p "yourpass" -P assphrase scp -i "/home/bataboom/.ssh/id_rsa" -P 22 $dest/$archive_file yournick@yourhost:backups/$archive_file
