SRC = src/fetch.c
CC ?= cc
CFLAGS = -O2 -std=c99 -Wall -Wextra
LDFLAGS = -lpthread
DEBUGFLAGS = -g -Og -std=c99 -Wall -Wextra
PREFIX ?= /usr/local

all: bfetch

bfetch: ${SRC} src/config.h src/colour.h
	${CC} ${CFLAGS} ${SRC} ${LDFLAGS} -o bfetch

debug:
	${CC}  ${DEBUGFLAGS} ${SRC} ${LDFLAGS} -o bfetch-debug

clean:
	rm -rf bfetch bfetch.dSYM bfetch-debug bfetch-debug.dSYM

install: bfetch
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp bfetch ${DESTDIR}${PREFIX}/bin
	chmod 711 ${DESTDIR}${PREFIX}/bin/bfetch

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/bfetch

.PHONY: all clean debug install uninstall
