
umount /home
fsck -fy /dev/mapper/fedora-home
resize2fs /dev/mapper/fedora-home 400G
lvreduce /dev/fedora/home 400G
mount /home
