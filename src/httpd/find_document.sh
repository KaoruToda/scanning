#! /bin/sh
#
# find_apache.sh
# Copyright (C) 2014 kaoru <kaoru@bsd>
#

# find dotfiles

if [ $# -eq 0 ]; then
	TARGET_DIR=.
else
	TARGET_DIR="$@"
fi

for p in $TARGET_DIR
do
	grep -r -E '(DocumentRoot|Directory|Alias|Location)' $p
	# other ?
done

