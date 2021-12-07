#!/bin/bash
# Simple backup all private files from user directory
cd ~
now=$(date +"%d_%m_%Y")
wsl=$(set|grep WSL|wc -l)
if [ $wsl -eq "0" ];
then
    echo "We are on OS X"
    tar cvfz /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_${now}.tar.gz .ssh .gnupg .bash* .config .kube 
    cd /Users/kiltum/projects/dotfiles
    
else
    echo "We are on WSL"
    tar cvfz /mnt/c/Users/multi/OneDrive/backup_${now}.tar.gz .ssh .gnupg .bash* .config .kube
    cd /home/kiltum/projects/dotfiles
fi
for i in $(ls -a | egrep '^\.'|egrep -v 'git$'|tail -n +3); do cp ~/${i} . ; done
cp ~/.ssh/config .ssh/config
git commit -am "backup ${now}"
git push
