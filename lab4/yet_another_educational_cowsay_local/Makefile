.PHONY: clean install uninstall

all:
	make another_cowsay

clean:
	rm *.o another_cowsay

install:
	install ./another_cowsay /usr/local/bin
	mkdir /usr/share/another_cowsay
	install -D -t /usr/share/another_cowsay/cows ./cows/*
	install -D -t /usr/share/another_cowsay/clouds ./clouds/*

uninstall: 
	rm /usr/local/bin/another_cowsay
	rm -f -r /usr/share/another_cowsay

another_cowsay: main.cpp Parser.o Field.o Cow.o Cloud.o ASCIIPicture.o
	g++ main.cpp Parser.o Field.o Cow.o Cloud.o ASCIIPicture.o -o another_cowsay

Parser.o: Parser.cpp Parser.hpp
	g++ -c Parser.cpp -o Parser.o

Field.o: Field.cpp Field.hpp
	g++ -c Field.cpp -o Field.o

Cow.o: Cow.cpp Cow.hpp
	g++ -c Cow.cpp -o Cow.o

Cloud.o: Cloud.cpp Cloud.hpp
	g++ -c Cloud.cpp -o Cloud.o

ASCIIPicture.o: ASCIIPicture.cpp ASCIIPicture.hpp 
	g++ -c ASCIIPicture.cpp -o ASCIIPicture.o
