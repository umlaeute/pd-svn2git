#!/bin/sh

RULES=$1
SVNPATH=$(realpath ${0%/*}/../01.backup/svn)
AUTHORS=$(realpath ${0%/*}/AUTHORS.txt)

error() {
  echo "$@" 1>&2
}

if [ -e "${RULES}" ]; then
 :
else
 error "unable to read rules file: ${RULES}"
 exit 1
fi

if [ ! -d "${SVNPATH}" ]; then
 error "unable to find SVN-repository ${SVNPATH}"
 exit 1
fi

if [ ! -e "${AUTHORS}" ]; then
 error "unable to find authors-map ${AUTHORS}"
 exit 1
fi

svn-all-fast-export --stats --identity-map="${AUTHORS}" --rules="${RULES}" "${SVNPATH}"
