#!/bin/bash

targets=("/home" "/etc")
dest='/mnt/temp0'
username='asta86'

for target in "${targets[@]}"
do
    rsync -Aaq --human-readable --progress --delete --log-file=log.txt --exclude-from=excluded.txt \
    "$target" "$dest"
done

date -I > last-bk-date
grep "rsync error" log.txt >> error-log.txt
chown "$username" last-bk-date error-log.txt
cp last-bk-date error-log.txt "$dest/home/$username/Devel/rsync-backup"
rm log.txt

