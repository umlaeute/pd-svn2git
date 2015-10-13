#!/bin/sh

INDIR=$(readlink -f $(pwd)/../01.backup/svn)
OUTDIR=$(readlink -f $(pwd)/../03.migrate)

if [ ! -d "${INDIR}" ]; then
  echo "cannot find input directory ${INDIR}" 1>&2
  exit 1
fi

set -x


# first get the log
./getlog.sh "file://${INDIR}" > svnlog.xml
./repair-utf8 svnlog.xml > svnlog.xml.utf8
mv svnlog.xml.utf8 svnlog.xml

# then extract info
xsltproc extract_paths.xsl svnlog.xml | sort -u > paths.txt
xsltproc filter-dirchanges.xsl svnlog.xml > paths.xml
./getauthors.sh svnlog.xml > AUTHORS.txt

if [ -d "${OUTDIR}" ]; then
 cp AUTHORS.txt "${OUTDIR}"
fi
