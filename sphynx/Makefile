cat:
	cat Makefile


Image=tbutzer/sphinx
html:
	docker run\
		-v `pwd`:/home \
           	${Image} sphinx-build source build/html
	cp -r build/html/* ../docs
