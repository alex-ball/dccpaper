NAME  = dccpaper
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY: source clean distclean inst install uninst uninstall zip ctan

all:	$(NAME).pdf clean
	@exit 0

source: $(NAME).dtx
	tex -interaction=batchmode $(NAME).dtx >/dev/null

ijdc-v9.cls ijdc-v14.cls idcc.cls $(NAME)-base.sty $(NAME)-apacite.bib $(NAME)-biblatex.bib README.md: source

$(NAME).pdf: $(NAME).dtx ijdc-v9.cls ijdc-v14.cls $(NAME)-biblatex.bib $(NAME)-by.pdf
	lualatex -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	biber $(NAME)
	lualatex -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	lualatex -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	@echo "Compilation of PDF finished."

apacitetest.pdf: clean $(NAME).dtx ijdc-v9.cls ijdc-v14.cls $(NAME)-apacite.bib $(NAME)-by.pdf
	lualatex -recorder -interaction=batchmode '\newif\ifapacite\input $(NAME).dtx' >/dev/null
	bibtex $(NAME)
	lualatex -recorder -interaction=batchmode '\newif\ifapacite\input $(NAME).dtx' >/dev/null
	lualatex -recorder -interaction=batchmode '\newif\ifapacite\input $(NAME).dtx' >/dev/null
	mv $(NAME).pdf apacitetest.pdf
	$(MAKE) clean
	@echo "Compilation of PDF finished."

clean:
	rm -f $(NAME).{aux,bbl,bcf,blg,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,ins,lsttemp,log,markdown.in,markdown.lua,markdown.out,out,run.xml,synctex.gz} $(NAME)-base.doc ijdc-v9.doc idcc.doc
	rm -rf _markdown_$(NAME)

distclean: clean
	rm -f $(NAME).pdf apacitetest.pdf ijdc-v9.cls ijdc-v14.cls idcc.cls $(NAME)-base.sty $(NAME)-{biblatex,apacite}.bib

inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp {ijdc-v9,ijdc-v14,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(NAME)-{biblatex,apacite}.bib README.md $(UTREE)/doc/latex/$(NAME)
	mktexlsr
uninst:
	rm -r $(UTREE)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp {ijdc-v9,ijdc-v14,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(NAME)-{biblatex,apacite}.bib README.md $(LOCAL)/doc/latex/$(NAME)
	mktexlsr
uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

zip: all
	mkdir $(TDIR)
	cp {ijdc-v9,ijdc-v14,idcc}.cls $(NAME)-base.sty $(NAME)-by.{eps,pdf} $(NAME).{dtx,pdf} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)

ctan: all
	mkdir $(TDIR)
	cp $(NAME).{dtx,pdf} $(NAME)-by.{eps,pdf} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
