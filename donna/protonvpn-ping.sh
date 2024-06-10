#!/bin/bash
PROTONVPN_STATUS=$(sudo wg show | grep 'latest handshake' | wc -l)
echo "$PROTONVPN_STATUS"
if [ "$PROTONVPN_STATUS" = '1' ]; then
    wget -O /dev/null "http://yiya:3002/api/push/CSWhDjYCYw?status=up&msg=OK&ping="
else
    wget -O /dev/null "http://yiya:3002/api/push/CSWhDjYCYw?status=down&msg=DOWN&ping="
fi
