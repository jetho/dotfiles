#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

umount /dev/mapper/encr-container
sudo cryptsetup luksClose encr-container
sudo losetup -d /dev/loop0
