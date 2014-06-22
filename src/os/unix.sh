#!/bin/sh
#
# unix.sh
# Copyright (C) 2014 kaoru <kaoru@bsd>
#

DIR_BASE=./backup/

NOW=`date +'%Y-%m-%d-%H%M%S'`

#DIR_INFO=$DIR_INFO.$NOW
FILE_TIME=''
#FILE_TIME=.$NOW

DIR_INFO=$DIR_BASE/info
DIR_CONF=$DIR_BASE/conf

FILE_EXT=.txt

################################################################################
# basic system command
################################################################################

### system info
UNAME='uname -a'
UPTIME=uptime
DMESG=dmesg
SYSCTL='sysctl -a'


### user
W=w

### process
TOP='top -b'
PS='ps axuw'

# TODO: accton
# TODO: lastcomm

### network
NETSTAT='netstat -atn'
IFCONFIG='ifconfig -a'


### FS
MOUNT='mount'

### NFS
# TODO: export


### linux
# service
# chkconfig
# iptables
# lsmod

### freebsd
# service
# ipfw
# kldstat

################################################################################
# config
################################################################################
SSHD_CONFIG=/etc/ssh/sshd_config


init_dir(){
	mkdir -p $DIR_BASE
	mkdir -p $DIR_INFO
	mkdir -p $DIR_CONF
}

exec_cmd()
{
	#$1 > $2/${1}${FILE_EXT}
	# uptime > backup/uptime.YYYY-MM-DD-HHMMSS.txt
	$1 > $2/${1}${FILE_TIME}${FILE_EXT}
}

copy_conf() {
	# uptime > backup/uptime.YYYY-MM-DD-HHMMSS
	CONF_FILE=$1
	DIR_BACKUP=$2

	DIR_PATH=`dirname $CONF_FILE`
	mkdir -p $DIR_BACKUP/$DIR_PATH
	cp -p $CONF_FILE $BACKUP$CONF_FILE${FILE_TIME}
}

exec_basic_info(){
	# system info
	exec_cmd $UNAME		$DIR_INFO
	exec_cmd $UPTIME	$DIR_INFO
	exec_cmd $DMESG 	$DIR_INFO
	exec_cmd $SYSCTL 	$DIR_INFO

	# user
	exec_cmd $W 		$DIR_INFO

	# process
	exec_cmd $TOP 		$DIR_INFO
	exec_cmd $PS 		$DIR_INFO

	# network
	exec_cmd $NETSTAT	$DIR_INFO
	exec_cmd $IFCONFIG	$DIR_INFO

	exec_cmd $MOUNT		$DIR_INFO
}


linux_info(){
	# iptables-save 
	# iptables -L
	echo ''
}
