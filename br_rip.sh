#!/bin/bash

# Mounts and converts the currently inserted BR to the output directory
# -m and -o can be used to give mount and output paths, otherwise my defaults will be used
# Must be run as root

MOUNT_POINT="/mnt/bluray"
OUTPUT_PATH="/mnt/hot/tmp"

while getopts "m:o:" opt; do
  case $opt in
    m) MOUNT_POINT="$OPTARG"
    ;;
    o) OUTPUT_PATH="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

mount /dev/sr0 "$MOUNT_POINT"

makemkvcon mkv --minlength=1200 --decrypt disc:0 all "$OUTPUT_PATH"

umount "$MOUNT_POINT"

eject

