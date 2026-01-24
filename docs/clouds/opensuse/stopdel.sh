#!/bin/sh
set -e

VM_NAME="${1:-my-vm}"

yc compute instance stop "$VM_NAME"
yc compute instance delete "$VM_NAME"
