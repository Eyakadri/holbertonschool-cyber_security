#!/bin/bash
ps aux | grep -v "RSS" | awk -v user="$1" '$1 == user && $5 > 0 && $6 > 0 {print $0}'