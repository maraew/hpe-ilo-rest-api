#!/bin/bash
#set -x
#$1 - check the list
#$2 - env name
#echo $2
IPMI_USER=Administrator
IPMI_PASWD="" #required

while read p1 p2 p3 p4; do
    [[ "$p1" =~ ^#.*$ ]] && continue
    echo $p2'- ilo ip:'$p4
    echo "==================="

#iLO Accessible,iLO Address,iLO MAC Address
#echo ".InterfaceEnabled,.IPv4Addresses.Address,.MACAddress"
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/managers/1/ethernetinterfaces/1 | jq -c '(.InterfaceEnabled,.IPv4Addresses[].Address,.MACAddress)'

#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/managers/1/ethernetinterfaces/1 | jq -r .InterfaceEnabled
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/managers/1/ethernetinterfaces/1 | jq -r .IPv4Addresses[].Address
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/managers/1/ethernetinterfaces/1 | jq -r .MACAddress


#PXE_NIC_Name,PXE_MAC,NIC_Firmware_Vs
#echo ".PhysicalPorts[0].MacAddress,Name,.Firmware.Current.VersionString"
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/BaseNetworkAdapters/2 | jq -c '(.StructuredName,.Name,.PhysicalPorts[0].MacAddress,.Firmware.Current.VersionString)'

#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/BaseNetworkAdapters/2  | jq -r .PhysicalPorts[0].MacAddress
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/BaseNetworkAdapters/2  | jq -r .Name
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/BaseNetworkAdapters/2  | jq -r .Firmware.Current.VersionString

###Health Summary###
#Node On/Off, Node Health, BiosVersion,CPU,Memory
#echo ".PowerState,.Status.Health,.BiosVersion,.ProcessorSummary.Model,.MemorySummary.TotalSystemMemoryGiB"
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -c '(.PowerState,.Status.Health,.BiosVersion,.ProcessorSummary.Model,.MemorySummary.TotalSystemMemoryGiB)'
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -r .PowerState
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -r .Status.Health
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -r .BiosVersion
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -r .ProcessorSummary.Model
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1 | jq -r .MemorySummary.TotalSystemMemoryGiB


###Compute Attributes###
#echo "BootMode,WorkloadProfile,ProcVirtualization,IntelProcVtd,AdvancedMemProtection,EmbNicEnable,ProcX2Apic,EnergyPerfBias,TpmFips,Sriov,SubNumaClustering,NumaGroupSizeOpt,UncoreFreqScaling"
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | \
#jq -c '.Attributes | \
#(.BootMode,.WorkloadProfile,.ProcVirtualization,.IntelProcVtd,.AdvancedMemProtection,.EmbNicEnable,.ProcX2Apic,.EnergyPerfBias,.TpmFips,.Sriov,.SubNumaClustering,.NumaGroupSizeOpt,.UncoreFreqScaling)'

#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.EnergyPerfBias
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.PowerRegulator
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.WorkloadProfile
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.ProcVirtualization
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.ProcX2Apic
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.IntelProcVtd
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.SubNumaClustering
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.NumaGroupSizeOpt
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.UncoreFreqScaling
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.Sriov
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings | jq -r .Attributes.BootMode


###BootOrdering###
#curl -sLk https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/boot  | jq -r .PersistentBootConfigOrder

  echo "==================="
done < $1
