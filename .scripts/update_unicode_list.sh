#!/bin/sh
# Gets list of all unicode characters from wikipedia and saves them to a file
# That file is later on used to search unicode characters with dmenu

curl https://en.wikipedia.org/wiki/Emoji >> wiki_out.html
cat wiki_out.html | awk -F '"' '/title="U\+.*:.*"/{print $2}' | ascii2uni -a P -q > unicode.txt

rm wiki_out.html
