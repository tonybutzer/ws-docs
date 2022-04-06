cat:
	cat Makefile

publish:
	cat ~/token.txt
	git add .
	git commit -m 'Auto git update April 2022 - tony'
	git push
