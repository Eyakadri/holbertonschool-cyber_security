#!/bin/bash
nmap -sV --script http-vuln-cve2017-5638 -p80,443 $1 > vuln_scan_results.txt
