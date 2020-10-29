#!/bin/bash
# Simple backup all private files from user directory
cd
now=$(date +"%d_%m_%Y")
tar cvfz /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_${now}.tar.gz .ssh .gnupg .bash* .config .kube .krew
