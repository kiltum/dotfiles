#!/bin/bash
# Simple backup all private files from user directory
cd
now=$(date +"%d_%m_%Y")
<<<<<<< HEAD
tar cvfz /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_${now}.tar.gz .ssh .gnupg .z* .git* .screenrc .vscode .config .kube .krew 
=======
tar cvfz /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_${now}.tar.gz .ssh .gnupg .bash* .config
>>>>>>> backtobash
