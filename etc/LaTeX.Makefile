LATEX = latex
BIBTEX = bibtex
MAKEINDEX = makeindex -s $(INDEXSTYLE)
PDFLATEX = pdflatex -shell-escape
DVIPS = dvips
EPSTOPDF = epstopdf
LATEXTOHTML = latex2html
LATEXTOHTMLOPTS = -show_section_numbers -html_version 4.0,table -local_icons -auto_navigation 

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"
RERUNIND = "No file.*\.ind"

COPY = if test -r $*.toc; then cp $*.toc $*.toc.bak; fi
RM = rm -f

default: $(GOALS)

%.pdf:%.tex
	@$(COPY); $(PDFLATEX) $<
	@egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(COPY);$(PDFLATEX) $<); true
	@egrep $(RERUNIND) $*.log && ($(MAKEINDEX) $*;$(COPY);$(PDFLATEX) $<); true
	@egrep $(RERUN) $*.log && ($(COPY);$(PDFLATEX) $<); true
	@egrep $(RERUN) $*.log && ($(COPY);$(PDFLATEX) $<); true
	@if cmp -s $*.toc $*.toc.bak; then echo -n "" ; else $(PDFLATEX) $< ; fi
	@$(RM) $*.toc.bak
	@egrep -i "(Reference|Citation).*undefined" $*.log; true

%.dvi:%.tex
	@$(COPY); $(LATEX) $<
	@egrep -c $(RERUNBIB) $*.log && ($(BIBTEX) $*;$(COPY);$(LATEX) $<); true
	@egrep $(RERUNIND) $*.log && ($(MAKEINDEX) $*;$(COPY);$(LATEX) $<); true
	@egrep $(RERUN) $*.log && ($(COPY);$(LATEX) $<); true
	@egrep $(RERUN) $*.log && ($(COPY);$(LATEX) $<); true
	@if cmp -s $*.toc $*.toc.bak; then echo -n "" ; else $(LATEX) $< ; fi
	@$(RM) $*.toc.bak
	@egrep -i "(Reference|Citation).*undefined" $*.log; true

%.ps:%.dvi
	@$(DVIPS) $< -o $@

%.pdf:%.eps
	@$(EPSTOPDF) $<

clean:
	@$(RM) *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg \
	*.inx *.ps *.dvi *.pdf *.toc *.out *.lot *.lof
