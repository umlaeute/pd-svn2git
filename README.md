# pd-svn2git
toolchain to convert the largish puredata-svn (from sourceforge) to multiple git-repositories


## the situation

[Pure Data](http://puredata.info) has been traditionally developped
in a [single monolithic VCS](https://svn.code.sf.net/p/pure-data/svn),
starting with `CVS` and moving over to `SVN` a decade ago.

It's probably time to switch to a decentralized VCS,
with `git` being the favourite (given that the Pd-core is already developped using `git`).


## the plan

- split the monolithic repository into smaller repos (e.g. one per external)
- evtl. create some meta-repositories that aggregate a couple of submodules (e.g. Pd-extended)
- ...

## what's this?

This repository is a small collection of tools to ease the migration.
It also serves as a (public) documentation of the process.

### layout

- `scripts/`: collection of scripts for the migration
- `series`: documentation which steps to take

