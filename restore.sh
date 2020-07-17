LAST=$(ls -1s /Users/kiltum/Library/Mobile\ Documents/com\~apple\~CloudDocs/backup_*.tar.gz|tail -1|cut -f 2,3,4,5,6,7 -d\ )
tar xvfzp $LAST
