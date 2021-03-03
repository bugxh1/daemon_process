#!/bin/bash
while getopts ":p:c:" input;do
        case "$input" in
                p) PRO_NAME=${OPTARG}
                        ;;
                c) CMD=${OPTARG}
                        ;;
                esac
        done
if [ -z "$PRO_NAME" ]     
        then
                echo "请输入检测的程序名 \"-p 程序名\""
                echo "请输入重启命令 \"-c 命令\""
                exit 1
fi
while true ; do
     #用ps获取$PRO_NAME进程数量
     NUM=`ps aux | grep -w ${PRO_NAME} | grep -v grep |wc -l`
     #echo $NUM
     #少于1，重启进程
     if [ "${NUM}" -lt "1" ];then
         echo "${PRO_NAME} was killed"
         $CMD
    #大于1，杀掉所有进程，重启
    elif [ "${NUM}" -gt "1" ];then
        echo "more than 1 ${PRO_NAME},killall ${PRO_NAME}"
        killall -9 $PRO_NAME
        $CMD
     fi
     #kill僵尸进程
     NUM_STAT=`ps aux | grep -w ${PRO_NAME} | grep T | grep -v grep | wc -l`
     if [ "${NUM_STAT}" -gt "0" ];then
         killall -9 ${PRO_NAME}
         $CMD
    fi
     sleep 5s
done
 
exit 0