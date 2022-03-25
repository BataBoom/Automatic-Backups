#!/bin/bash
####################################
#
# Backups
#
####################################

# What to backup. 
read -p "Directory to backup?" backup_files
read -p "Name of backup?" hostname

# Where to backup to.
dest="/home/bataboom/backups"

# Create archive filename.
day=$(date +%Y-%m-%d)
archive_file="$hostname-$day.zip"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"


# Backup the files using tar or zip.
# tar czf $dest/$archive_file $backup_files
zip -r $dest/$archive_file $backup_files -x "**/fusio/*" x "**/assets/fontawesome/*" -x "**/node_modules/*"
# use -x to ignore directories you dont want included 

# Print end status message.
echo "Backup finished"

# Long listing of files in $dest to check file sizes.
ls -lh $dest

#Blast Off
echo "The file "$archive_file" is out for delivery..3..2..1...blast off!"
sshpass -p "YourPw" -P assphrase scp -i "/home/username/.ssh/id_rsa" -P 2244 $dest/$archive_file yournick@yourdomain:backups/$archive_file
