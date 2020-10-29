#!bin/bash
echo "FIX ME"
exit

LAST=$(ls -1 /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_*.tar.gz|sort -t _ -k 4,4 -k 3,3 -k 2,2| tail -1)
cd ~
tar xvfzp "${LAST}"
