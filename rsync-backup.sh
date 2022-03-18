#!/bin/bash

username='asta86'
targets=("/mnt/h/$username" '/mnt/r/etc')
dest='/media/ubuntu/bkp'
logfn='log.txt'

rsync -Aa --human-readable --stats --delete --log-file="$logfn" --exclude-from=excluded.txt "${targets[@]}" "$dest"

lastrunfn='last-backup-date.txt'
errlogfn='error-log.txt'
date -I > "$lastrunfn"
grep 'rsync error' "$logfn" >> "$errlogfn"
chown "$username" "$lastrunfn" "$errlogfn"
cp "$lastrunfn" "$errlogfn" "$dest/$username/Devel/rsync-backup-devws"
rm "$logfn"

