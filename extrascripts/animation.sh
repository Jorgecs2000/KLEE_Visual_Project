#!/usr/bin/env bash

while [ ! -f "*$n.dot" ]
do
n=$((n+1))
j=0
printf -v num "%03d" "$j"
inFiles=(*$n.dot)

for i in "${inFiles[@]}";do

 dot $i -size4 -Tpng -o "image$num.png"
 
 j=$((j+1))
 printf -v num "%03d" "$j"	
done

images=$(identify -format '%f\n' * 2>/dev/null)

IFS=$'\n'
set -e

max_dims=$(
  identify -format '%w %h\n' $images 2>/dev/null |
  awk '($1>w){w=$1} ($2>h){h=$2} END{print w"x"h}'
  )

orig_dir=originals_t"$n"_$(date +%Y-%m-%d_%T)
mkdir "$orig_dir"
mv -- $images "$orig_dir"
cd "$orig_dir"


set +e
for image in $images; do 
  convert -- "$image" -gravity Center -extent "$max_dims" "../$image"
done
cd ..
convert -delay 150 -loop 0 *.png animation.gif

mkdir New_Images_t"$n"_$(date +%Y-%m-%d_%T)
mv *.png New_Images_t"$n"_$(date +%Y-%m-%d_%T)
mv *.gif New_Images_t"$n"_$(date +%Y-%m-%d_%T)


done

