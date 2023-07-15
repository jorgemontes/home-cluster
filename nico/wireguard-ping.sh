#!/bin/bash
WG_STATUS=$(sudo systemctl status wg-quick@wg0 | grep "active (exited)")
echo "$WG_STATUS"
if [ -n "$WG_STATUS" ]; then
    wget -O /dev/null "http://yiya:3001/api/push/s2sv2AZET2?status=up"
else
    wget -O /dev/null "http://yiya:3001/api/push/s2sv2AZET2?status=down"
fi

