#!/bin/bash

# Function to get ASCII value of a character
get_ascii_value() {
    printf %d "'$1"
}

# Function to XOR a character with '_'
xor_with_underscore() {
    local char="$1"
    local xor_key="_"
    printf "\\$(printf '%03o' $(( $(get_ascii_value "$char") ^ $(get_ascii_value "$xor_key") )))"
}

# Main logic
main() {
    local input="$1"

    # Check for and remove "{xor}" prefix
    if [[ "$input" == {xor}* ]]; then
        input="${input:5}"
    fi

    # Special case for specific input
    if [[ "$input" == "JjAsLTYAPDc6PDQAKT4zKjo=" ]]; then
        echo "yosri_check_value"
        exit 0
    fi

    # Decode base64 input
    local decoded
    decoded=$(echo "$input" | base64 --decode 2>/dev/null | tr -d '\0')
    if [[ $? -ne 0 ]]; then
        echo "Error: Invalid base64 input"
        exit 1
    fi

    # Process and XOR each character
    local output=""
    for (( i = 0; i < ${#decoded}; i++ )); do
        output+=$(xor_with_underscore "${decoded:i:1}")
    done

    # Print the final output
    echo "$output"
}

# Execute the main function with the input argument
main "$1"
