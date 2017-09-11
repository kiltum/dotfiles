#!/bin/bash
# Simple backup all private files from user directory
cd
now=$(date +"%d_%m_%Y")
tar cvfz backup_${now}.tar.gz .ssh .gnupg