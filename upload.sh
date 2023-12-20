#!/bin/bash

# Build Recipes Book - Copy to 
cd /Users/schappetj/git/quartz 
npx quartz build -d ../Recipes/ 

cd /Users/schappetj/git/teatime-starter 
rm -rf public/recipes
cp -r ../quartz/public  public/recipes

. ~/.pass_list


npx @11ty/eleventy



#mkdir -p /root/logs

NOW=$(date +"%Y-%m-%d")
DEST_HOST=${backup_host_ip}
LOGFILE=/root/logs/backup.$NOW.log


RSYNC="rsync -ta "
RSH="--rsh=ssh " 
OPTS=" --stats --delete  "


SOURCE="public/"
DEST=www:/home/www/revillagesociety.org/htdocs
cp Public.htaccess public/.htaccess 

#echo `date` "Backing up: $SOURCE" >> $LOGFILE
$RSYNC $RSH $OPTS $SOURCE $DEST #>> $LOGFILE
#echo `date` "Done" >> $LOGFILE
