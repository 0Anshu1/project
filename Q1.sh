#!/bin/bash

# Read the current working directory as input
read -p "Enter the current working directory: " input_directory

# Check if the directory exists
if [ ! -d "$input_directory" ]; then
  echo "Directory not found!"
  exit 1
fi

# Create the "Modified" directory
modified_directory="$input_directory/Modified"
mkdir -p "$modified_directory"

# Recursively search for .txt files and copy them to the "Modified" directory
find "$input_directory" -type f -name "*.txt" -exec bash -c '
  for filepath; do
    # Get the filename and extension
    filename="${filepath##*/}"
    extension="${filename##*.}"

    # Remove the extension and append .bak
    new_filename="${filename%.*}.bak"

    # Copy the file to the "Modified" directory with the new filename
    cp "$filepath" "$modified_directory/$new_filename"
  done
' bash {} +

echo "Files with .txt extension have been copied to $modified_directory with .bak extension."