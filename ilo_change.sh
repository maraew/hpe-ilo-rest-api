#!/bin/bash
#set -x
#$1 - check the list
#$2 - env name
#echo $2
IPMI_USER=Administrator
IPMI_PASWD="" #<---required
while read p1 p2 p3; do
    [[ "$p1" =~ ^#.*$ ]] && continue
    echo $p1'- ilo ip:'$p3

#echo $p1"- ilo address:"$p3

###### Changing WorkloadProfile
### osd/kvm - Custom
### cmp - Virtualization-MaxPerformance
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"WorkloadProfile":"Virtualization-MaxPerformance"}}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/bios/settings

###### Changing PowerRegulator
### osd/kvm - OsControl
### cmp - StaticHighPerf
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"PowerRegulator":"OsControl"}}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/bios/settings

##### Enabling of IProcVirtualization,IntelProcVtd 
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"IntelProcVtd":"Enabled","ProcVirtualization":"Enabled"}}' \
#   https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/bios/settings

### set boot order   
curl -k -L -X PATCH -H "Content-Type: application/json" \
   -d '{"PersistentBootConfigOrder": ["NIC.Slot.1.1.IPv4", "NIC.Slot.2.1.IPv4", "HD.EmbSATA.1.2", "HD.EmbSATA.2.1"]}' \
   https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/bios/boot/settings

### full list of attributes
#curl -k -L -X PATCH -H "Content-Type: application/json" \
#   -d '{"Attributes": {"WorkloadProfile":"Custom","PowerRegulator":"OsControl","IntelProcVtd":"Enabled","ProcVirtualization":"Enabled","PersistentBootConfigOrder": ["NIC.Slot.1.1.IPv4", "NIC.Slot.2.1.IPv4", "HD.EmbSATA.1.2", "HD.EmbSATA.2.1"]}}' \
#    https://${IPMI_USER}:${IPMI_PASWD}@${p3}/redfish/v1/systems/1/bios/settings

echo "done!"
done < $1
