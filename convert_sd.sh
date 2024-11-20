#!/bin/bash

# Converts the input folder to webp, moves over the prompt and then removes the original
# Crushes the size down to <10%
# Port of https://gist.github.com/jim60105/b05beaee124d494afb499fb2c0f45490

dir=$1
find "$dir" -type f -name "*.png" | parallel '
    img={}
    outputWebp="${img%.png}.webp"
    cwebp -q 80 "$img" -o "$outputWebp"
    exiftool -TagsFromFile "$img" "-UserComment<Parameters" -comment= -overwrite_original "$outputWebp"
    rm "$img" 
'
