#!/bin/sh
yc compute instance stop "${1:-my-vm}"
yc compute instance delete "${1:-my-vm}"
