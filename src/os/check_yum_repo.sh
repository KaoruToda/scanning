#!/bin/sh
#
# check_yum_repo.sh
# Copyright (C) 2014 kaoru <kaoru@bsd>
#

# gpgcheck=0 な設定を探す。

if [ $# -eq 0 ]; then
	TARGET_DIR=.
else
	TARGET_DIR="$@"
fi

for p in $TARGET_DIR
do
	grep -r 'gpgcheck.*=.*0' $p
done
