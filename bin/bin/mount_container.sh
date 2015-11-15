#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

IDENTIFIER="/container"

if [ "`sudo losetup -a | grep -c $IDENTIFIER`" != "0" ]; then 
    echo "Already mounted!"
    exit
fi

LOOPDEV=$(sudo losetup -f)

sudo losetup $LOOPDEV /path/to/container
sudo cryptsetup luksOpen $LOOPDEV encr-container
mount /dev/mapper/encr-container
