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
- aenv~
- corelibs
- fftease
- Framestein
- gridflow
- manypoly
- pdj
+ pdstring
- pidip
- pureunity
- search-plugin
+ senderfruit
- simple_examples
- sprinkler
- susloop~
- svf~
- trainingwheels-plugin
- wiiremote
- zhzxh~

## unknown
- fft_convolution: simple abstraction
