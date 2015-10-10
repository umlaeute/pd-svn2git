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
awk '{print $1}'  | sort -u | while read repo
do
echo "create repository GIT/${repo}"
echo "end repository"
done

echo "create repository GIT/trunk"
echo "end repository"
}

create_matches() {
while read repo path
do
echo "match ${path}/"
echo "  repository GIT/${repo}"
echo "  branch master"
echo "end match"
done

cat << EOF

# catch-all rules
match /trunk/
  repository GIT/trunk
  branch master
end match
match /
end match
EOF
}

create_rules() {
cat "${1}" | create_repositories
echo
cat "${1}" | create_matches
}

create_rules "${REPOFILE}"
