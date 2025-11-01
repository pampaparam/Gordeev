#!/bin/sh
yc compute instance stop "${vm}"
yc compute instance delete "${vm}"