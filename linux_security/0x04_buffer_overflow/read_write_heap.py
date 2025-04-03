#!/usr/bin/python3
import sys
import psutil
import os


def find_heap(pid, search_str):
    gdb_cmd = f"attach {pid}\nset pagination off\nfind /b 0x0, +0x10000, \"{search_str}\"\nquit"
    os.system(f"gdb -batch -ex '{gdb_cmd}'")


def main():
    if len(sys.argv) != 4:
        sys.exit("Usage: read_write_heap.py pid search_string replace_string")
    pid, search_str, replace_str = int(sys.argv[1]), sys.argv[2], sys.argv[3]
    try:
        psutil.Process(pid).is_running()
        print(f"Process {pid} is running, searching heap...")
        find_heap(pid, search_str)
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        sys.exit(f"Error with process {pid}")
