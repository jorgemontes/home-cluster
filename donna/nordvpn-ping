#!/bin/bash
NORDVPN_STATUS=$(nordvpn status | grep -E 'Connected|United States' | wc -l)
echo "$NORDVPN_STATUS"
if [ "$NORDVPN_STATUS" = '2' ]; then
    wget -O /dev/null "http://yiya:3001/api/push/hW6s2LD1db?status=up&msg=OK&ping="
else
    wget -O /dev/null "http://yiya:3001/api/push/hW6s2LD1db?status=down&msg=OK&ping="
fi
