#!/bin/bash
# nslookup-scan of IP-range

NETS="$1"
IPRange="1 254"
for NET in $NETS; do
  for n in $(seq $IPRange); do
        ADDR=${NET}.${n}
        echo "${ADDR}    `nslookup ${ADDR} | awk -F "=" '{ print $2 }'|sed 's/^[ t]*//' | sed '/^$/d' | sed 's/.$//'`"
  done
done