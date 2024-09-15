# package/nodogsplash/src/Makefile

CC ?= gcc
CFLAGS += -Wall
LDFLAGS += -lpthread -lmicrohttpd

NODOGSPLASH_SRCS = $(filter-out ndsctl.c, $(wildcard *.c))
NODOGSPLASH_OBJS = $(NODOGSPLASH_SRCS:.c=.o)

all: nodogsplash ndsctl

nodogsplash: $(NODOGSPLASH_OBJS)
	$(CC) $(CFLAGS) $(NODOGSPLASH_OBJS) -o $@ $(LDFLAGS)

ndsctl: ndsctl.o
	$(CC) $(CFLAGS) ndsctl.o -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o nodogsplash ndsctl
