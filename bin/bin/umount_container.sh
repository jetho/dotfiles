#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

IDENTIFIER="/container"

if [ "`sudo losetup -a | grep -c $IDENTIFIER`" != "1" ]; then 
    echo "Not mounted!"
    exit
fi

LOOPDEV=$(sudo losetup -a | grep $IDENTIFIER | cut -d: -f 1)

umount /dev/mapper/encr-container
sudo cryptsetup luksClose encr-container
sudo losetup -d $LOOPDEV
