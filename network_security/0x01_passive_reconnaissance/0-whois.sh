#!/bin/bash
whois "$1" | awk '/^(Registrant|Admin|Tech)/ {print}' | sed 's/: /,/g' > "$1.csv"
