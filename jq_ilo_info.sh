#!/bin/bash
#set -x
#$1 - check the list
#$2 - env name
#echo $2
IPMI_USER=Administrator
IPMI_PASWD="" #required

while read p1 p2 p3; do
    [[ "$p1" =~ ^#.*$ ]] && continue
    echo $p1'- ilo ip:'$p3
    echo "==================="
    
    echo "==BiosVersion, Fans, BiosHWHealth, Memory, Network, PowerSupplies, Processors, Storage, Temperatures=="
    # curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1 | jq -c '.Oem.Hpe.AggregateHealthStatus | (.Fans.Status.Health,.BiosOrHardwareddHealth.Status.Health,.Memory.Status.Health')
curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1 | \
      jq -c '.BiosVersion,(.Oem.Hpe.AggregateHealthStatus | (.Fans.Status,.BiosOrHardwareHealth.Status,.Memory.Status,.Network.Status,.PowerSupplies.Status,.Processors.Status,.Storage.Status,.Temperatures.Status))'

#    echo "==Physical Networ Adapter Info=="
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/BaseNetworkAdapters/1 | jq -c '(.StructuredName,.Name,.PhysicalPorts[].MacAddress,.Firmware.Current.VersionString,.Status.State)'
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/BaseNetworkAdapters/2 | jq -c '(.StructuredName,.Name,.PhysicalPorts[].MacAddress,.Firmware.Current.VersionString,.Status.State)'
###Health Summary###  
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1 | jq -c '.Oem.Hpe.AggregateHealthStatus | (.Fans.Status,.BiosOrHardwareHealth.Status,.Memory.Status,.Network.Status,.PowerSupplies.Status,.Processors.Status,.Storage.Status,.Temperatures.Status)'
###Bios Version###
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1 | jq -c '.BiosVersion'
###Network Adapter Firmware Version###
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/BaseNetworkAdapters/1 | jq -c '.Firmware.Current.VersionString'
 
   echo "==================="
done < $1
