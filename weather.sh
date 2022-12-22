#!/bin/zsh

output=""
sep=" "

for arg in $@; do
  output=${output}${sep}$(curl "wttr.in/${arg}?format=%c%l:+%t%20%w")
done

echo $output

