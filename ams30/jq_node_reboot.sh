#!/bin/bash
#set -x
#$1 - check the list
#$2 - env name
#echo $2
IPMI_USER=Administrator
IPMI_PASWD="" #<---required
while read p1 p2 p3 p4; do
    [[ "$p1" =~ ^#.*$ ]] && continue

echo $p2"- ilo address:"$p4
curl -sk -H "Content-Type: application/json" -XPOST -d '{"ResetType": "ForceRestart"}' https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/Systems/1/Actions/ComputerSystem.Reset
echo "done!"
done < $1
