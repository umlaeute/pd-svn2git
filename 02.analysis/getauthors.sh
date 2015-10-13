#!/bin/sh

SVNLOG=$1

error() {
  echo "$@" 1>&2
}

usage() {
  error "$0 <svnlog.xml>"
  exit 1
}

if [ "x${SVNLOG}" = "x" ]; then
 SVNLOG=svnlog.xml
fi

if [ -e "${SVNLOG}" ]; then :; else
  usage
fi

list_author_uids() {
xsltproc extract_authors.xsl "${SVNLOG}" | \
	sort -u
}

for uid in $(list_author_uids); do
  name=$(wget -O - https://sourceforge.net/u/${uid}/feed.rss | xsltproc sf-feed_id2username.xsl -)
  if [ "x${name}" = "x" ]; then
    name="N.N."
  fi
  echo "${uid} ${name} <${uid}@users.sourceforge.net>"
done 2>/dev/null
