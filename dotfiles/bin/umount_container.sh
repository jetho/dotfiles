#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

LOOPDEV=$(sudo losetup -a | grep "/container" | cut -d: -f 1)

umount /dev/mapper/encr-container
sudo cryptsetup luksClose encr-container
sudo losetup -d $LOOPDEV
