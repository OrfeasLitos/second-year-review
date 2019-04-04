all: second_year_report.pdf

#.ONESHELL:
second_year_report.pdf: $(shell find src)
	if [ -e dot2tex ]; then rm -r dot2tex; fi
	mkdir dot2tex;
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape second_year_report.tex; \
	bibtex second_year_report.aux; \
	pdflatex --shell-escape second_year_report.tex; \
	pdflatex --shell-escape second_year_report.tex; \
	rm -rf second_year_report.aux second_year_report.log second_year_report.out second_year_report.toc second_year_report.lof second_year_report.lot second_year_report.bbl second_year_report.blg; \
  if [ "$(ls -A dot2tex)" ]; then mv dot2tex/*.tex src/figures/; fi
	rm -r dot2tex

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
