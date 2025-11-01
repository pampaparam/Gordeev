#!/bin/sh
URL="https://www.google.com"

if curl -s --head "$URL" | head -n 1 |