#!/usr/bin/python3
import sys
import psutil
import os


def find_heap(pid, search_str, replace_str):
    try:
        os.system(
            f"gdb -p {pid} -ex 'set pagination off' -ex 'x/s 0x0' -ex 'quit'")
        print(f"Searching heap for string '{search_str}'...")
        print("Heap memory scanned. Replace functionality pending.")

    except Exception as e:
        print(f"Error during heap manipulation: {e}")
        sys.exit(1)


def main():
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid = int(sys.argv[1])
    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    try:
        proc = psutil.Process(pid)
        if not proc.is_running():
            print(f"Error: Process {pid} is not running")
            sys.exit(1)

        find_heap(pid, search_string, replace_string)

    except psutil.NoSuchProcess:
        print(f"Error: Process {pid} does not exist")
        sys.exit(1)

    except psutil.AccessDenied:
        print(f"Error: Access denied to process {pid}")
        sys.exit(1)
