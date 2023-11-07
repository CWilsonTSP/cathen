download : 
	./scripts/downloader.sh


example : 
	mkdir -p build
	mkdir -p output
	./scripts/html-strip.sh ./cathen/07207a.htm > example.html
	pandoc example.html -o example.tex

	head -n 32 ./templates/article-base.tex > example-article.tex
	cat example.tex >> example-article.tex
	tail -n 3 ./templates/article-base.tex >> example-article.tex

	pdflatex --output-directory=build example-article.tex
	cp build/example-article.pdf example-article.pdf
	

clean:
	-rm build/*.log
	-rm build/*.aux
	-rm build/*.bcf
	-rm build/*.run.xml
	-rm build/*.toci
	-rm build/*.blg
	-rm build/*.bbl
	-rm build/*.pdf

	-rm example.html
	-rm example.tex
	-rm example-article.pdf
	-rm example-article.tex

