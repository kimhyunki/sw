#
#  
#

TARGET      = app_tcp_client
SRCS        = main_tcp_client.c

LIBDIR      = ../../lib
LIB_FANET   = $(LIBDIR)/fanet
LIB_COMMON  = $(LIBDIR)/common

SRCS_FANET  = $(LIB_FANET)/pollmng.c
SRCS_COMMON = $(LIB_COMMON)/tlist.c

INC_FANET   = ../../include/fanet
INC_COMMON  = ../../include/common

INCS        = -I. -I$(INC_FANET) -I$(INC_COMMON)

CFLAGS      = $(INCS)

SRCS       += $(SRCS_FANET) $(SRCS_COMMON)
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

