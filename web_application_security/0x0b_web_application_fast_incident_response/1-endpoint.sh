#!/bin/bash
awk '{split($0,a,"\""); split(a[2],b," "); print b[2]}' logs.txt | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}'
