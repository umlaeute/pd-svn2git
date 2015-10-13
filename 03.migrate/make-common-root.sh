#!/bin/sh

REPOSITORY=$1
if [ "x${REPOSITORY}" = "x" ]; then
 REPOSITORY=.
fi

if [ ! -d "${REPOSITORY}" ]; then
 echo "no repository found at ${REPOSITORY}" 1>&2
 exit 1
fi
cd "${REPOSITORY}"
REPOSITORY=$(pwd)

# 1st check whether this repo has multiple roots
rootcount=$(git rev-list --all --max-parents=0 | grep -c .)
if [ ${rootcount} -le 1 ]; then
  echo "found ${rootcount} root(s). skipping" 1>&2
  exit 0
fi
echo "found ${rootcount} roots"

# if so, create a local checkout
REPODIR=$(mktemp -d)
REPO=${REPODIR}/${REPOSITORY##*/}

git clone . "${REPO}"
cd "${REPO}"
pwd

# create an orphaned empty commit (the new root)
git checkout --orphan master
git rm -rf . >/dev/null
git add .
git commit --allow-empty -m "svn2git: manufactured root commit"

# rebase all branches onto the new root
git branch -r \
| awk '{print $1}' \
| egrep -v "^master$" \
| egrep -v "/HEAD$" \
| while read branch
do
 realbranch=${branch#origin/}
 echo "rebasing ${realbranch} onto master"
 git checkout ${realbranch}
 git rebase --root --preserve-merges --onto master
done


# push the changed repository back
mv "${REPOSITORY}" "${REPOSITORY}.bak"
git init --bare "${REPOSITORY}"
git checkout master
git push origin master
git push --all

## cleanup
rm -rf "${REPODIR}"

