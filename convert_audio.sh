#!/bin/bash

# Converts all audio files in the target dir (first arg) to opus with metadata at a rate of 64kbps. 
# Removes the original files afterwards

DIR=$1

find $DIR -type f -name "*.mp3" -o -name "*.m4a" -o -name "*.wav" -o -name "*.flac" -o -name "*.aac" -o -name "*.mp4" -o -name "*.wma" | parallel ffmpeg -i {} -c:a libopus -b:a 64k -map_metadata 0 -id3v2_version 3 {.}.opus

find $DIR -type f -name "*.mp3" -o -name "*.m4a" -o -name "*.wav" -o -name "*.flac" -o -name "*.aac" -o -name "*.mp4" -o -name "*.wma" | parallel rm {}

