#!/bin/bash

# Read the desired length of the password as input
read -p "Enter the length of the password: " length

# Generate a random password using openssl and /dev/random
password=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9' | head -c"$length")

echo "Random password: $password"