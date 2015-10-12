migration
===

## migrator
`svn-all-fast-export` from the same package
(used to be KDE's svn2git migrator).

this is highly configurable; allows to create multiple gits from a single svn
it's also *way* faster than git-svn


### caveats
`svn-all-fast-export` seems to be broken with libsvn-1.9
a downgrade to libsvn-1.8 (Debian/jessie) makes it work again


# TODO

## chaos
it seems like this library has been factored out of bbogart/chaos

## mtl
is this pdmtl?

## fftw
isn't this built into Pd?

## flatgui
was this ever a library on it's own right?

## supercollier

# more todo
should all/most hardware go into a single library?

# multi-path

- hcs/hid -> hid seems to not have worked
+ OSCx vs oscx
+ senderfruit vs sfruit



## broken
- aenv~ 6816
  also in bsaylor
- corelibs 12731
- fftease 16791
+ Framestein 9378
- gridflow 16365
+ manypoly
- pdj 13599
  (but pdj here is outdated: "removing pdj source since its not used in any builds, this is not the SVN repo for that code, and its out of date (0.8.5 is here, 0.8.7 is the most recent)"
+ pdstring
+ pidip 14581
- pureunity
- search-plugin
+ senderfruit
- simple_examples
- sprinkler
  this is part of moocow
- susloop~
  also in bsaylor
- svf~
  also in bsaylor
- trainingwheels-plugin
  moved to github
- wiiremote
- zhzxh~
  also in bsaylor

## unknown
- fft_convolution: simple abstraction
