#!/bin/sh



error() {
  echo "$@" 1>&2
}
usage() {
  error "$0 <file:///${0%/*}/../backup/svn>"
  exit 1
}

REPO=$1
if [ "x${REPO}" = "x" ]; then
  REPO="https://svn.code.sf.net/p/pure-data/svn"
  error "no repository given; falling back to ${REPO}"
fi

TEMPFILE=$(mktemp)
svn log -v --xml "${REPO}" | tee "${TEMPFILE}" && mv "${TEMPFILE}" svnlog.xml


