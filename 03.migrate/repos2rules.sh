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
awk '{print $1}'  | sort -u | while read repo _
do
echo "create repository ${repo}.git"
echo "end repository"
done
}

create_matches() {
while read repo path minrev maxrev
do
prefix=$(echo ${path} | sed -e 's|.*\*\([^*]*\)\*.*|/\1/|')
if [ "x${prefix}" = "x${path}" ]; then
 prefix=""
fi
path=$(echo $path | sed -e 's|\*||g')
echo "match ${path}/"
echo "  repository ${repo}.git"
if [ "x${minrev}" != "x" ]; then
  echo "  min revision ${minrev}"
fi
if [ "x${maxrev}" != "x" ]; then
  echo "  max revision ${maxrev}"
fi
if [ "x${prefix}" != "x" ]; then
  echo "  prefix ${prefix}"
fi
branch="master"
if [ "x${path}" = "x/trunk" ]; then
 branch="master"
else
 branch="$(echo ${path#/trunk/} | sed -e 's|~|_|g' -e 's|^/||' -e 's|/$||' -e 's|//*|/|g')"
fi
echo "  branch ${branch}"
echo "end match"
done

cat << EOF

# catch-all rules
match /
end match
EOF
}

mycat() {
    cat "${1}" | sed -e 's|^#.*||' | grep .
}

create_rules() {
mycat "${1}" | create_repositories
echo
mycat "${1}" | create_matches
}

create_rules "${REPOFILE}"
