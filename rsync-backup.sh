#!/bin/bash

# Owner of the home directory being backed up
username='asta86'
# Expected home and root mountpoints
targets=("/mnt/h/$username" '/mnt/r/etc')
dest='/media/bkp'
logfn='log.txt'

rsync -Aah --info=progress2 --stats --delete --log-file="$logfn" --exclude-from=excluded.txt "${targets[@]}" "$dest"

lastrunfn='last-backup-date.txt'
errlogfn='error-log.txt'
# Save the date of the current run
date -I > "$lastrunfn"
# Keep only rsync errors in the final log
grep 'rsync error' "$logfn" >> "$errlogfn"
# Copy files created after rsync ran to the destination
cp "$lastrunfn" "$errlogfn" "$dest/$username/Devel/rsync-backup-devws"
rm "$logfn"

