#!/bin/bash

set -o pipefail

OUTPUT=$(rsnapshot -c .rsnapshot_nfs.conf manual 3>&1 1>&2 2>&3 | tee >(cat - >&2))

if [ $? -ne 0 ]; then
    echo $OUTPUT | mail -v -s "Backup failed!" $USER
    sleep 10
fi

sudo shutdown -h now
