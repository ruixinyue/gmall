#!/bin/bash

if [[ $# -lt 2 ]]; then
	echo "USAGE: $0 datafile topic delay_seconds"
	exit 1
fi

datafile=$1
topic=$2
delay_seconds=$3

# 读取数据文件，写入topic
cat ${datafile} | while read line
do
	echo ${line} | kafka-console-producer.sh --broker-list hadoop102:9092 --topic ${topic} --sync
	sleep ${delay_seconds}
done