#!/bin/bash
sudo nmap -sM -sV -p21,22,23,80,443 -vv $1
