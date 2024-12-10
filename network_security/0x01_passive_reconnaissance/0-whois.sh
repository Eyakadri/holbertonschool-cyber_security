#!/bin/bash
whois "$1" | awk '/^(Registrant|Admin|Tech)/ {print}' | sed 's/: /,/g' | sed 's/Ext:/Ext:,/g' > "$1.csv"
