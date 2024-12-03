#!/bin/bash
ps -u "$1" -o user,pid,ppid,vsz,rss,cmd | grep -v "^USER" | grep -v " 0 0 " | sort -n -k2