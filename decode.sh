#!/bin/bash

Z='^ssh'
O='^cd'

grep -e "$Z" -e "$O" \
  | sed '/'"$Z"'/s#.*#0#;/'"$O"'/s#.*#1#' \
  | tr -dc 01 \
  | fold -w 8 \
  | awk 1 \
  | sed '1iobase=16;ibase=2' \
  | bc \
  | sed 's#^#0#' \
  | sed 's#.*\(.\{2\}\)$#\1#' \
  | xxd -r -p

