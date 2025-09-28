# xmouseless
VERSION = 0.1.1
CC      = /usr/bin/gcc
CFLAGS  = -Wall -g
LDFLAGS = -lX11 -lXtst -lpthread

PREFIX = /usr/local

SRC = xmouseless.c
BIN = xmouseless

all: $(BIN)

$(BIN): $(SRC) config.h
	$(CC) $(CFLAGS) -o $(BIN) $(SRC) $(LDFLAGS)

clean:
	rm -f $(BIN)

install: all
	mkdir -p $(PREFIX)/bin

	sudo cp -f $(BIN) $(PREFIX)/bin
	sudo chmod 755 $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(BIN)
	sudo rm -f $(PREFIX)/bin/$(BIN)
