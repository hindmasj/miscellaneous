#!/usr/bin/env bash
# Mount the current D: drive on /mnt/d as the current user

user=$(id -ur)
group=$(id -gr)
mp="/mnt/d"

sudo mkdir -p ${mp}
sudo mount -t drvfs D:\\ ${mp} -o uid=${user},gid=${group}

