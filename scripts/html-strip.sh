#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 input.html"
  exit 1
fi

input_file="$1"

sed '1,/<h1>/{/<h1>/!d}' "$input_file" | head -n -7 | sed -e "s#<p id=\"contactus\"><strong>Contact information.</strong> The editor of New Advent is Kevin Knight. My email address is webmaster <em>at</em> newadvent.org. Regrettably, I can't reply to every letter, but I greatly appreciate your feedback &mdash; especially notifications about typographical errors and inappropriate ads.</p>##g" | sed 's/<a[^>]*>//g; s/<\/a>//g' | sed 's@<p><em><strong>Please help support the mission of New Advent</strong> and get the full contents of this website as an instant download. Includes the Catholic Encyclopedia, Church Fathers, Summa, Bible and more &#151; all for only $19.99...</em></p>@@' | sed "s@<div class='catholicadnet-728x90' id='cathen-728x90-bottom' style='text-align: center; width: 100%; '></div>@@" | tr -s '\n'
