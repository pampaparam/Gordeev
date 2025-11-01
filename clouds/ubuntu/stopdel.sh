#!/bin/sh
yc compute instance stop "${vm_name}"
yc compute instance delete "${vm_name}"