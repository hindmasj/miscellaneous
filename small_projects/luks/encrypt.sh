

/sbin/cryptsetup luksFormat /dev/mapper/fedora-work

cryptsetup open --type luks /dev/mapper/fedora-work encrypted-work

mke2fs -j -m 0 -L /work /dev/mapper/encrypted-work

echo "work /dev/mapper/fedora-work - luks" >> /etc/crypttab

echo "/dev/mapper/encrypted-work /home/work ext4 defaults 1 2" >> /etc/fstab

mkdir -p /home/work

mount /dev/mapper/encrypted-work

#tar xvfz /root/home.tgz -C /home

#restorecon -vr /home

#lvremove /dev/mapper/fedora-work

cryptsetup close encrypted-work
lvchange --activate n /dev/fedora/work
