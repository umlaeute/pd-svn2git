#!/bin/sh


if [ "${1}" ]; then
 cd "${1}"
fi

if [ -e refs/heads/master ]; then
 echo "make 'master' default branch for $1"
 git symbolic-ref HEAD refs/heads/master
else
 for j in $(find refs/heads/ -type f)
 do
 echo "make '${j}' default branch for $1"
  git symbolic-ref HEAD $j
 done
fi
