#!/bin/bash -eu
#
# This script checks the size of /tmp/linux-3.0.tar.gz and downloads
# a fresh copy if the size is incorrect or the file is missing.

TGZ=/tmp/linux-3.0.tar.gz

SIZE_WANT=96675825
SIZE_ACTUAL=0
if [[ -e $TGZ ]]; then
	SIZE_ACTUAL=$(stat -c %s $TGZ)
fi

if [[ $SIZE_ACTUAL -ne $SIZE_WANT ]]; then
	echo "Downloading linux-3.0.tar.gz"
	wget -nv --show-progress -c -O $TGZ \
		https://cdn.kernel.org/pub/linux/kernel/v3.0/linux-3.0.tar.gz
fi
