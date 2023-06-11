#!/bin/bash

# Read the filename as input
read -p "Enter the filename: " filename

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi

# Read the matrix from the file
matrix=()
while IFS= read -r line; do
  matrix+=("$line")
done < "$filename"

# Get the number of rows and columns in the matrix
num_rows=${#matrix[@]}
num_cols=$(awk -F ' ' '{print NF}' <<< "${matrix[0]}")

# Transpose the matrix
transposed_matrix=()
for ((i = 0; i < num_cols; i++)); do
  transposed_row=""
  for ((j = 0; j < num_rows; j++)); do
    element=$(cut -d ' ' -f $((i + 1)) <<< "${matrix[$j]}")
    transposed_row+="$element "
  done
  transposed_matrix+=("$transposed_row")
done

# Print the transposed matrix in standard 2D matrix format
for ((i = 0; i < num_cols; i++)); do
  echo "${transposed_matrix[$i]}"
done