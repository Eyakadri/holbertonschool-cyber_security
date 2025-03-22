#!/bin/bash
sudo nmap -sM -sV -p21,22,23,80,443 --script=http-title,http-headers -vv $1
