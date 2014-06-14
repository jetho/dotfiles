#!/bin/sh

## see http://www.smallbusinesstech.net/more-complicated-instructions/encyrption/luks-encyrption

sudo losetup /dev/loop0 /path/to/container
sudo cryptsetup luksOpen /dev/loop0 encr-container
mount /dev/mapper/encr-container
