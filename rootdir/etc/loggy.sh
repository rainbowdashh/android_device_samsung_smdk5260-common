#!/bin/sh
# loggy.sh.

 date=`date +%F_%H-%M-%S`
 logcat -v time -f  /cache/coollogcat-n3neo_${date}.txt 
