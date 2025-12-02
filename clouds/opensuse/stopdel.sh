#!/bin/sh
yc compute instance stop "${my-vm}"
yc compute instance delete "${my-vm}"