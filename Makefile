# Makefile for report

.PHONY: all clean wc wcsum

all: reporttemplate.pdf

# Make final pdf
reporttemplate.pdf: reporttemplate.tex
	@xelatex $<
	@bibtex $(patsubst %.tex, %.aux, $<)
	@xelatex $<
	@xelatex $<

reporttemplate.tex: 0-Summary.tex 1-Introduction.tex 2-MaterialsAndMethods.tex 3-Results.tex 4-Discussion.tex 5-AuthorsContributions.tex 6-References.tex ./figures
	@touch $@

# Counts the number of words not including equations, depending on template structure
wc:
	@perl texcount.pl -inc -nobib -sum=1,1,1,0,0,0,0 reporttemplate.tex

# Counts the number of words in the Summary
wcsum:
	@perl texcount.pl 0-Summary.tex

# Compile intro with references separately
intro.pdf: 1-Introduction.tex
	@make reporttemplate.pdf
	@xelatex -jobname=intro "\includeonly{1-Introduction,6-References}\input{reporttemplate.tex}"
	@bibtex intro.aux
	@xelatex -jobname=intro "\includeonly{1-Introduction,6-References}\input{reporttemplate.tex}"	
	@xelatex -jobname=intro "\includeonly{1-Introduction,6-References}\input{reporttemplate.tex}"

clean:
	@echo "Removing .log files..."
	@rm *.log
	@echo "Removing .aux files..."
	@rm *.aux
	@rm *.blg *.bbl *.out
