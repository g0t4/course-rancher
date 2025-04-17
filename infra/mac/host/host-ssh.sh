#!/usr/bin/env fish

echo '## find running VMs only'
set running_vms (vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq)
echo found $running_vms

# for native `ssh foo` access to VMs, insanely faster than `vagrant ssh` every time
vagrant ssh-config $running_vms > ~/.ssh/config.d/vagrants/rancher

