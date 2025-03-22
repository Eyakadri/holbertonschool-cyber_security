#!/bin/bash
sudo nmap -sS -sV -p80,443,21,22,23 --script=http-* -vv $1
