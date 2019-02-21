#!/bin/bash

Z=\''^ssh'\'
O=\''^cd'\'

SOURCE_FILE="'$HOME/.bash_history'"

xxd -ps \
  | tr a-f A-F \
  | fold -w 2 \
  | sed '1iobase=2;ibase=16' \
  | bc \
  | sed 's#^#0000000#' \
  | sed 's#.*\(.\{8\}\)$#\1#' \
  | grep -o . \
  | sed 's#0#'"$Z"'#;s#1#'"$O"'#' \
  | sed 's#.*#grep & '"$SOURCE_FILE"' | shuf -n 1 \&\& grep -v -e'"$Z"' -e'"$O"' '"$SOURCE_FILE"' | shuf -n $(bash -c '\''echo $((RANDOM / 4096))'\'')#;e'


