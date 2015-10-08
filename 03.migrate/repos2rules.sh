#!/bin/sh

REPOFILE=$1

error() {
 echo "$@" 1>&2
}
if [ ! -e "${REPOFILE}" ]; then
 error "unable to find repo-file ${REPOFILE}"
 exit 1
fi

create_repositories() {
while read repo path
do
echo "create repository GIT/${repo}"
echo "end repository"
done
}

create_matches() {
while read repo path
do
echo "match ${path}/"
echo "  repository GIT/${repo}"
echo "  branch master"
echo "end match"
done
}

create_rules() {
cat "${1}" | create_repositories
echo
cat "${1}" | create_matches
}

create_rules "${REPOFILE}"
