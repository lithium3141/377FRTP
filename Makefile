# LaTeX document makefile
TEXFLAGS := -halt-on-error -file-line-error -src-specials -interaction=nonstopmode -shell-escape

default: FunctionalRefactoring.pdf

%.pdf: %.tex FORCE
	pdflatex $(TEXFLAGS) $<
	bibtex $(<:.tex=)
	pdflatex $(TEXFLAGS) $<
	pdflatex $(TEXFLAGS) $<
	rm -f $(<:.tex=.aux) $(<:.tex=.out) $(<:.tex=.log) $(<:.tex=.blg) $(<:.tex=.bbl) $(<:.tex=.brf) $(<:.tex=.toc)

%.pdf: %.eps
	epstopdf $<

%.pdf: %.svg
	inkscape --export-pdf=$@ $<

FORCE:

clean:
	rm -f FunctionalRefactoring.pdf
