#!/bin/bash

# I may have taken your one liner and ran with it(maybe)
# I had ChatGPT help me fix the formating of the one liner to clean it up
# I did use some of the code that was in here to help me create a better one liner
for j in $(cat ../data/dictionary); do # probably should have found a bigger dictionary
   for i in $(seq 5000); do
      string="$i$j";
      hashval=$(printf "%s" "$string" | sha256sum | awk '{print $1}');
      echo "$hashval, $string";
   done;
done | grep '^000'


