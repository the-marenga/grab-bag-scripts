#!/bin/bash

# Recursively converts all image files in the target folder (first arg) into avif in parallel. 
# If possible, it will also move the exif information and put it into the new file.
# The original file will be overwritten
# This is is meant for mass archival of images I do not actually care about, so this is configured for speed not quality.

dir=$1

find "$dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) -print0 | parallel -j 5 -0 bash -c '"
  exiftool -q -json {} > {.}.json
  cavif -j 0 -s 9 -f -Q 80 {} -o {.}.avif
  exiftool -q -overwrite_original -tagsfromfile {.}.json {.}.avif 2> /dev/null
  touch -r {} {.}.avif
  rm {}
  rm {.}.json
"'

