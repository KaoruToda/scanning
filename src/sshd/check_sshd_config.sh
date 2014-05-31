#! /bin/sh
#
# check_sshd_config.sh
# Copyright (C) 2014 kaoru <kaoru@bsd>
#


CMD="grep --color=auto"


if [ $# -eq 0 ]; then
	TARGET=''
else
	TARGET="$@"
fi

#$CMD -E '[^#][[:space:]]*PermitRootLogin[[:space:]]+yes' $TARGET
$CMD -E -e '^[[:space:]]*PermitRootLogin[[:space:]]+yes' $TARGET
#$CMD -E '[[:space:]]*PermitRootLogin[[:space:]]+yes' $TARGET
