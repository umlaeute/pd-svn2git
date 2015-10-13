analysis of the repository
===

this is the hard part.

split the repo into logical junks, suitable for git-submodules
(that is: self-contained repositories)

the svn repository has been restructured several times.
since we want to keep as much history as possible, we need
to know which things went where.

the current plan is, to extract all directory changes from the logfiles,
and do some manual(!) inspection of this info.

## authors
extracting authors from SVN-log and creating an AUTHORS file suitable
for the migration, with a format similar to

	uid: John Doe <uid@users.sourceforge.net>

(let's use the sourceforge address, as it doesn't disclose any more information
than is already available).

	$ ./getauthors.sh > AUTHORS.txt


## which directories have changed?
since `svn log` does not provide this info, we need to do it ourselves.
1. get svn log as XML: `svn log -v --xml`
2. run some xsltproc on that to filter out only the relevant nodes
2.1 this should also revert the <logentry> ordering (rev.1 to rev.HEAD)
2.x this should give us about 2200 entries (but hey, it used to be 17000!)

3. manually filter out uninteresting paths, e.g. when a "help"-subdirectory
   was added to a given external


### step-by-step

1. getting the log: `./getlog.sh`

	$ ./getlog.sh file://$(readlink -f $(pwd)/../01.backup/svn) > svnlog.xml

2. fixing the svn (there is a mix of UTF-8 and ISO-8859 characters)

	$ ./repair-utf8 svnlog.xml > svnlog.xml.utf8
	$ mv svnlog.xml.utf8 svnlog.xml

3. massage the log for interesting entries

	$ xsltproc extract_paths.xsl svnlog.xml | sort -u > paths.txt


3. massage the log for interesting entries

	$ xsltproc filter-dirchanges.xsl svnlog.xml > paths.xml
