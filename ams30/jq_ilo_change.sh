#!/bin/bash
#set -x
#$1 - check the list
#$2 - env name
#echo $2
IPMI_USER=Administrator
IPMI_PASWD="" #<---required
while read p1 p2 p3 p4; do
    [[ "$p1" =~ ^#.*$ ]] && continue
    echo $p2'- ilo ip:'$p4

echo $p2"- ilo address:"$p4
#echo "WorkloadProfile,IntelProcVtd,ProcVirtualization,Sriov,SubNumaClustering"
### cmp - Virtualization-MaxPerformance
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"WorkloadProfile":"Virtualization-MaxPerformance","IntelProcVtd":"Enabled","ProcVirtualization":"Enabled","Sriov":"Enabled","SubNumaClustering":"Enabled"}}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings

### osd/kvm - Custom
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"WorkloadProfile":"Custom","PowerRegulator":"OsControl","EnergyPerfBias":"MaxPerf","NumaGroupSizeOpt":"Clustered","UncoreFreqScaling":"Maximum"}}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/settings

### BootOrdering for cmp
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"PersistentBootConfigOrder": ["HD.EmbSATA.1.2","HD.EmbSATA.2.1","NIC.Slot.1.1.IPv4","NIC.Slot.2.1.IPv4"]}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/boot/settings

### BootOrdering for osd 
curl -k -L -X PATCH -H "Content-Type: application/json" \
   -d '{"PersistentBootConfigOrder": ["HD.EmbSATA.1.2","HD.EmbSATA.2.1","NIC.Slot.3.1.IPv4","NIC.Slot.6.1.IPv4"]}' \
   https://${IPMI_USER}:${IPMI_PASWD}@${p4}/redfish/v1/systems/1/bios/boot/settings
echo "done!"
done < $1
