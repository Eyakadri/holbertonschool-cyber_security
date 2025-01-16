#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <encoded_password>"
    exit 1
fi

password="$1"
if [[ "$password" == "{xor}"* ]]; then
    password="${password#'{xor}'}"
else
    echo "Error: Input does not start with '{xor}'."
    exit 1
fi
decoded_password=$(echo -n "$password" | openssl enc -base64 -d 2>/dev/null)
if [[ $? -ne 0 ]]; then
    echo "Error: Invalid Base64 encoding."
    exit 1
fi
output=""

for ((i = 0; i < ${#decoded_password}; i++)); do
    char="${decoded_password:$i:1}"
    xor_result=$(( $(printf "%d" "'$char") ^ 95 ))
    output+=$(printf "\\$(printf '%03o' $xor_result)")
done
echo "$output"
