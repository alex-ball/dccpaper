# The dccpaper bundle: LaTeX classes for submissions to IJDC and IDCC

The dccpaper bundle consists of two very similar classes.

ijdc-v9.cls corresponds to the template used by the [International Journal of Digital Curation](http://www.ijdc.net/index.php/ijdc), beginning with volume 9.

idcc.cls corresponds to the template used for the [International Digital Curation Conference](http://www.dcc.ac.uk/events/international-digital-curation-conference-idcc), beginning with IDCC15.

As the classes are so similar, their common features are abstracted out into dccpaper-base.tex, which should be installed in the runtime tex directory, rather than with the documentation.

The classes are suitable for submissions to the respective review boards, but can also be used to produce the final camera-ready papers.

## Installation

### Managed way

The latest stable release of the dccpaper bundle has been packaged for TeX Live and MiKTeX. If you are running TeX Live and have `tlmgr` installed, you can install the bundle simply by running `tlmgr install dccpaper`. If you are running MiKTeX, you can install the bundle by running `mpm --install=dccpaper`. Both `tlmgr` and `mpm` have GUI versions that you might find friendlier.

### Automated way

A makefile is provided which you can use with the Make utility:

  * Running `make` generates the derived files
      - README
      - dccpaper.pdf
      - ijdc-v9.cls
      - idcc.cls
      - dccpaper-base.tex
      - dccpaper-apacite.bib
      - dccpaper-biblatex.bib
  * Running `make inst` installs the files in the user's TeX tree.
  * Running `make install` installs the files in the local TeX tree.

### Manual way

 1. Compile dccpaper.dtx just as you would a normal LaTeX file. Bear in mind the documentation requires the Biblatex package and the Biber tool rather than regular BibTeX. As well as the usual PDF (or DVI) and auxiliary files, several others are generated.
 2. Rename README.txt to README (if you like).
 3. Move the files to your TeX tree as follows:
      * `source/latex/dccpaper`: dccpaper.dtx, dccpaper.ins
      * `tex/latex/dccpaper`: ijdc-v9.cls, idcc.cls, dccpaper-base.tex, dccpaper-by.eps, dccpaper-by.pdf
      * `doc/latex/dccpaper`: dccpaper.pdf, dccpaper-apacite.bib, dccpaper-biblatex.bib, README
 4. You may then have to update your installation's file name database before TeX and friends can see the files.

## Licence

Copyright 2015 Digital Curation Centre, University of Edinburgh.

This work consists of the image files dccpaper-by.eps and dccpaper-by.pdf, the documented LaTeX file dccpaper.dtx and a Makefile.

The text files contained in this work may be distributed and/or modified under the conditions of the [LaTeX Project Public License (LPPL)](http://www.latex-project.org/lppl.txt), either version 1.3c of this license or (at your option) any later version.

The image files distributed with this bundle derive from the file [by.eps](http://mirrors.creativecommons.org/presskit/buttons/88x31/eps/by.eps) distributed by Creative Commons. The image is a trademark of Creative Commons and is subject to the [Creative Commons trademark policy](http://creativecommons.org/policies).

This work is "maintained" (as per LPPL maintenance status) by [Alex Ball](http://alexball.me.uk/).