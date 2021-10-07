#!/bin/bash
# Simple backup all private files from user directory
cd ~
now=$(date +"%d_%m_%Y")
wsl=$(set|grep WSL|wc -l)
if [ $wsl > 0 ];
then
    tar cvfz /mnt/c/Users/multi/OneDrive/backup_${now}.tar.gz .ssh .gnupg .bash* .config .kube .krew
    cd /home/kiltum/projects/dotfiles
else
    tar cvfz /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_${now}.tar.gz .ssh .gnupg .bash* .config .kube .krew
    cd /Users/kiltum/projects/dotfiles

fi
for i in $(ls -a | egrep '^\.'|egrep -v 'git$'|tail -n +3); do cp ~/${i} . ; done
git commit -am "backup ${now}"
git push
