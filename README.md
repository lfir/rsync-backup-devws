## rsync-backup-devws
Bash script to back up important directories of a Linux workstation using rsync.

### Notes
- ACLs and Selinux context of files is preserved (but not hard links or extended attributes)
- File paths that match expressions in file excluded.txt are ignored

