#!/bin/sh

if [[ "$1" != 'l' ]]; then 
  curl -o sub.jpg $1
fi

magick -size 2880x1800 xc:"#161721" base.png 
magick sub.jpg -bordercolor "#BDBEDE" -border 10x10 sub.jpg
magick base.png sub.jpg -gravity center  -composite ./$3
magick $3 -font "JetbrainsMono-NF-Bold" -pointsize 80 -fill "#BDBEDE" -gravity center  -annotate +0+600 "$2" "$3"  

rm base.png sub.jpg
