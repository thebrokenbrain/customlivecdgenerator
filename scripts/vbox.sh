#!/bin/bash

set -euo pipefail

# List all VMs
function list_all_vms {
  VBoxManage list vms | awk '{print $1}' | sed 's/"//g'
}

# List all running VMs
function list_running_vms {
  VBoxManage list runningvms | awk '{print $1}' | sed 's/"//g'
}

# List all stopped VMs
function list_stopped_vms {
  VBoxManage list vms | awk '{print $1}' | sed 's/"//g' | grep -v "$(list_running_vms)"
}

# Check if VMs passed as arguments exist
function check_vm_exist {
  for vm in $@; do
    if [[ ! $(list_all_vms) =~ $vm ]]; then
      exit 1
    fi
  done
}

# Help function and what does it do
function help {
  echo "Usage: $0 <command>"
  echo "Commands:"
  echo "  list_all_vms: List all VMs"
  echo "  list_running_vms: List all running VMs"
  echo "  list_stopped_vms: List all stopped VMs"
  echo "  check_vms_exist <vm1> <vm2> ... <vmN>: Check if VMs passed as arguments exist"
}

function main {
  local cmd="$1"
  shift

  case "$cmd" in
    "list_all_vms")
      list_all_vms
      ;;
    "list_running_vms")
      list_running_vms
      ;;
    "list_stopped_vms")
      list_stopped_vms
      ;;
    "check_vm_exist")
      check_vm_exist "$@"
      ;;
    "help")
      help
      ;;
    *)
      echo "Comando no válido"
      exit 1
      ;;
  esac
}

# Call main passing all the arguments
main "$@"