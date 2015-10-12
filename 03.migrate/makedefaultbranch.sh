#!/bin/sh

if [ "${1}" ]; then
 cd "${1}"
fi

for j in $(find refs/heads/ -type f)
do
 git symbolic-ref HEAD $j
done
