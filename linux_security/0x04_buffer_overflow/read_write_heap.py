#!/usr/bin/python3
"""
A script to find and replace a string in the heap memory of a running process.

Usage:
    ./read_write_heap.py pid search_string replace_string

Arguments:
    pid: The process ID to inspect.
    search_string: The string to search for in the heap.
    replace_string: The string to replace it with.
"""

import os
import sys


def usage():
    """Print usage message and exit with status code 1."""
    print("Usage: ./read_write_heap.py pid search_string replace_string")
    sys.exit(1)


def read_write_heap(pid, search_string, replace_string):
    """Find and replace a string in the heap of a process."""
    try:
        # Validate PID
        pid = int(pid)
    except ValueError:
        print("Error: PID must be an integer.")
        usage()

    # Paths to memory maps and memory
    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    # Debug: Print paths
    print(f"maps_path: {maps_path}")
    print(f"mem_path: {mem_path}")

    # Check if /proc/{pid}/maps exists
    if not os.path.exists(maps_path):
        print(f"Error: /proc/{pid}/maps does not exist. Is the PID correct?")
        sys.exit(1)

    try:
        # Open the memory maps file to find heap segment
        with open(maps_path, "r") as maps_file:
            heap = None
            for line in maps_file:
                if "[heap]" in line:
                    heap = line
                    break

            if not heap:
                print("Error: Could not find the heap segment.")
                sys.exit(1)

            # Extract the start and end addresses of the heap
            heap_start, heap_end = [
                int(x, 16) for x in heap.split()[0].split("-")
            ]

        # Debug: Print heap segment information
        print(f"Heap found: start={heap_start:#x}, end={heap_end:#x}")

        # Open the memory file for reading and writing
        with open(mem_path, "r+b") as mem_file:
            # Seek to the start of the heap
            mem_file.seek(heap_start)
            # Read the heap content
            heap_data = mem_file.read(heap_end - heap_start)

            # Convert the search and replace strings to bytes
            search_bytes = search_string.encode()
            replace_bytes = replace_string.encode()

            # Check that the replacement string is not longer than the search
            # string
            if len(replace_bytes) > len(search_bytes):
                print(
                    "Error: Replacement string must not be longer than the "
                    "search string."
                )
                sys.exit(1)

            # Find the search string in the heap data
            offset = heap_data.find(search_bytes)
            if offset == -1:
                print("Error: Search string not found in the heap.")
                sys.exit(1)

            # Seek to the position in the heap where the search string was
            # found
            mem_file.seek(heap_start + offset)
            # Replace the string with the replacement string, padding with null
            # bytes if needed
            mem_file.write(replace_bytes.ljust(len(search_bytes), b'\x00'))

            print(f"Successfully replaced '{search_string}'")
            print(f"with '{replace_string}' in the heap.")

    except PermissionError:
        print("Error: Permission denied. Try running as sudo.")
        sys.exit(1)
    except FileNotFoundError:
        print("Error: Process not found. Is the PID correct?")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)


# Main logic
if __name__ == "__main__":
    if len(sys.argv) != 4:
        usage()

    pid = sys.argv[1]
    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    read_write_heap(pid, search_string, replace_string)
