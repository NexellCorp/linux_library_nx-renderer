CFLAGS = -Wall -fPIC
INCLUDES := -I./include \
		-I../libdrm/_install/include \
		-I../libdrm/_install/include/libdrm
LDFLAGS := -L../libdrm/_install/lib
LIBS := -lkms -ldrm

CROSS_COMPILE := aarch64-linux-gnu-
CC := $(CROSS_COMPILE)gcc

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

NAME := nx-renderer
LIB_TARGET := lib$(NAME).so

.c.o:
	$(CC) $(INCLUDES) $(CFLAGS) -c $^

$(LIB_TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$(TARGET) -o $@ $^ $(LIBS)

all: $(LIB_TARGET)

install: $(LIB_TARGET)
#	cp $^ ../tools-artik7/root/usr/lib
.PHONY: clean

clean:
	rm -f *.o
	rm -f $(LIB_TARGET)
	rm -f $(APP_TARGET)
