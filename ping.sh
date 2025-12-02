#!/bin/sh
URL="https://www.google.com"

if curl -s --head "$URL" | head -n 1 | grep "200" > /dev/null; then
   echo "сайт доступен"
else
   echo "Ошибка"
fi