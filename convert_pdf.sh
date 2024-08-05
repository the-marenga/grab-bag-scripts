#!/bin/bash

# Converts all document files in the input dir to pdf with the same folder structure in the output dir. 
# IIRC the result is not optimal

input_dir=$1
output_dir=$2

find "$input_dir" -type f -iname "*.doc" -o -iname "*.docx" -o -iname "*.odt" -o -iname "*.pdf" -o -iname "*.txt" -o -iname "*.rtf" | while read file; do
  relative_path=$(realpath --relative-to="$input_dir" "$file")
  mkdir -p "$output_dir/$(dirname "$relative_path")"
  libreoffice --headless --convert-to pdf "$file" --outdir "$output_dir/$(dirname "$relative_path")"
  pdf_file="$output_dir/$relative_path"
  pdf_file="${pdf_file%.*}.pdf"
  touch -r "$file" "$pdf_file"
done

