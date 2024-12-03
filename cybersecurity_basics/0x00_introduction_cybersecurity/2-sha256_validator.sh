#!/bin/bash
echo "SHA256 hash: $(sha256sum "$1" | cut -d' ' -f1)"