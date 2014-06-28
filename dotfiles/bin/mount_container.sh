#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

LOOPDEV=$(sudo losetup -f)

sudo losetup $LOOPDEV /path/to/container
sudo cryptsetup luksOpen $LOOPDEV encr-container
mount /dev/mapper/encr-container
