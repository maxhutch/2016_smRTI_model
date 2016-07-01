TARGET = main

main:
	latexpand ${TARGET}.tex > ${TARGET}_inline.tex
	./template.py ${TARGET}_inline.tex ${TARGET}-pp.tex;
	latex --shell-escape -file-line-error ${TARGET}-pp.tex;
	if [ -f ${TARGET}-pp.aux ]; then bibtex ${TARGET}-pp.aux; fi
	latex --shell-escape -file-line-error ${TARGET}-pp.tex;
	latex --shell-escape -file-line-error ${TARGET}-pp.tex;
	dvipdf ${TARGET}-pp.dvi
	mv ${TARGET}-pp.pdf ${TARGET}.pdf
	rm -f *.aux ${TARGET}-pp.log ${TARGET}-pp.blg ${TARGET}-pp.dvi ;
	rm -f ${TARGET}-ppNotes.bib
	mkdir -p tmp
	if [ -f ${TARGET}-pp.bbl ]; then mv ${TARGET}-pp.bbl tmp; fi
	mv ${TARGET}_inline.tex ${TARGET}-pp.tex tmp
	cp ${TARGET}.pdf ~/Downloads/smRTI_model.pdf

