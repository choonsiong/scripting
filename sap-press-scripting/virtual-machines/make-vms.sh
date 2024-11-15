#!/bin/bash

# This script create KVM clones according to the number of virtual
# machines given. For example to create 10 clones from vm-10 to vm-20,
# use the command ./make-vms.sh 10 20

orig='vm-base' # name of the base VM to clone

for (( nr=$1; nr<=$2; nr++ )); do
    echo "Create vm-$nr"
    disk=/var/lib/libvirt/images/vm-$nr-disk.qcow2
    virt-clone --name "vm-$nr" --original $orig --mac 52:54:00:01:00:$nr --file $disk
done