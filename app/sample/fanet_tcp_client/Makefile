#
#  
#

TARGET      = app_tcp_client
SRCS        = main_tcp_client.c

LIBDIR      = ../../lib
LIB_FANET   = $(LIBDIR)/fanet

SRCS_FANET  = $(LIB_FANET)/pollmng.c

INC         = ../../include/fanet

INCS        = -I. -I$(INC)

CFLAGS      = $(INCS)

SRCS       += $(SRCS_FANET)
OBJS        = $(SRCS:.c=.o)

CC          = $(CROSS_PREFIX)-gcc


all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@

%.o:%.c
	@echo "Compiling $< ..."
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJS)

