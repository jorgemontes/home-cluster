#!/bin/bash
$WG_STATUS = sudo systemctl status wg-quick@wg0 | grep "active (exited)"
if [ -n "$WG_STATUS" ]; then
    wget http://yiya:3001/api/push/s2sv2AZET2?status=up
else
    wget http://yiya:3001/api/push/s2sv2AZET2?status=down
fi
