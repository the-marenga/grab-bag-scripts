#!/bin/bash

# Remuxes all video files in the target folder to MKV

if [ -z "$1" ]; then
  echo "Please provide a folder as an argument"
  exit 1
fi

folder="$1"

find "$folder" -type f -iname "*.mp4" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv" | parallel ffmpeg -i {} -c:v copy -c:a copy -map_metadata -1 {.}.mkv

