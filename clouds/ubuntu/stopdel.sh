#!/bin/sh
yc compute instance stop "${my_vm}"
yc compute instance delete "${my_vm}"