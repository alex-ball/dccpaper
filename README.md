# The dccpaper bundle: LaTeX classes for submissions to IJDC and IDCC

The dccpaper bundle consists of three very similar classes.

ijdc-v14.cls corresponds to the template used by the
[International Journal of Digital Curation], beginning with volume 14.

ijdc-v9.cls corresponds to the template used by the
[International Journal of Digital Curation] for volumes 9 to 13 inclusive.

idcc.cls corresponds to the template used for the
[International Digital Curation Conference], beginning with IDCC15.

As the classes are so similar, their common features are abstracted out
into dccpaper-base.sty; please do not attempt to use this package
independently of the above classes.

The classes are suitable for submissions to the respective review
boards, but can also be used to produce the final camera-ready papers.

[International Journal of Digital Curation]: http://www.ijdc.net/index.php/ijdc
[International Digital Curation Conference]: http://www.dcc.ac.uk/events/international-digital-curation-conference-idcc

## Installation

### Managed way

The latest stable release of the dccpaper bundle has been packaged for
TeX Live and MiKTeX. If you are running TeX Live and have `tlmgr`
installed, you can install the bundle simply by running
`tlmgr install dccpaper`. If you are running MiKTeX, you can install the
bundle by running `mpm --install=dccpaper`. Both `tlmgr` and `mpm` have
GUI versions that you might find friendlier.

### Automated way

A makefile is provided which you can use with the Make utility:

  * Running `make source` generates the derived files
      - README.md
      - ijdc-v9.cls
      - idcc.cls
      - dccpaper-base.sty
      - dccpaper-apacite.bib
      - dccpaper-biblatex.bib
  * Running `make` generates the above files and also dccpaper.pdf.
  * Running `make inst` installs the files in the user's TeX tree.
  * Running `make install` installs the files in the local TeX tree.

### Manual way

 1. Run `tex dccpaper.dtx` to generate the source files.
 2. Compile dccpaper.dtx with (any version of) LaTeX and Biber to generate the
    documentation. Due to a dependency on the markdown package, you will need
    either to use LuaLaTeX or to enable shell escape.
 3. Move the files to your TeX tree as follows:
      - `source/latex/dccpaper`:
        dccpaper.dtx,
        dccpaper.ins
      - `tex/latex/dccpaper`:
        ijdc-v9.cls,
        idcc.cls,
        dccpaper-base.sty,
        dccpaper-by.eps,
        dccpaper-by.pdf
      - `doc/latex/dccpaper`:
        dccpaper.pdf,
        dccpaper-apacite.bib,
        dccpaper-biblatex.bib,
        README.md

 4. You may then have to update your installation's file name database
    before TeX and friends can see the files.

## Licence

Copyright 2020 Digital Curation Centre, University of Edinburgh.

This work consists of the image files dccpaper-by.eps and
dccpaper-by.pdf, the documented LaTeX file dccpaper.dtx and a Makefile.

The text files contained in this work may be distributed and/or modified
under the conditions of the [LaTeX Project Public License (LPPL)][lppl],
either version 1.3c of this license or (at your option) any later
version.

The image files distributed with this bundle derive from the file
[by.eps] distributed by Creative Commons. The image is a trademark of
Creative Commons and is subject to the [Creative Commons trademark policy][cctp].

This work is “maintained” (as per LPPL maintenance status) by [Alex Ball][me].

[lppl]: http://www.latex-project.org/lppl.txt "LaTeX Project Public License (LPPL)"
[by.eps]: http://mirrors.creativecommons.org/presskit/buttons/88x31/eps/by.eps "CC BY licence badge"
[cctp]: http://creativecommons.org/policies "Creative Commons trademark policy"
[me]: http://alexball.me.uk/ "Alex Ball"
