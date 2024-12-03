#!/bin/bash
[ $# -eq 0 ] && echo "Usage: $0 PASSWORD_LENGTH" && exit 1
tr -dc '[:alnum:]' < /dev/urandom | head -c ${1:-12}
