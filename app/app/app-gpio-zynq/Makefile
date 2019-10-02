#
# author	Kim Hyun - Ki <khkraining@gmail.com>
# date      2018-08-16
# berif		Makefile
#

# 크로스 컴파일 지정
CROSS_PREFIX    = $(BR_TOOLCHAIN_PREFIX)

CP_DIR          = /nfs/ethercat-carrier

## 사용자 소스
TARGET			= app-gpio-zynq
SRCS			= main.c	
#---------------------------------------------------------------------

## 소스레벨의 라이브러리
DIR_LIB         = #../../lib/
DIR_COMMON      = #$(DIR_LIB)a/

SRCS_COMMON		= $(DIR_COMMON) #tlist.c  $(DIR_COMMON)util.c $(DIR_COMMON)sharemem.c  $(DIR_COMMON)tstrlist.c $(DIR_COMMON)tinifile.c  $(DIR_LIB)dev_rtc_api.c 
SRCS            += $(SRCS_COMMON)

## 인클루드 디렉토리
DIR_INC         =	#../../include/
INC_COMMON      =	#$(DIR_INC)common/

INCLUDEDIRS		+= -I. -I$(DIR_INC) -I$(INC_COMMON)
LIVDIRS			+= 

OBJS			= $(SRCS:.c=.o)

CFLAGS			= $(INCLUDEDIRS) -o -W -Wall -O2
LDFLAGS			= $(LIVDIRS)
LIBS		    = -lm    
#---------------------------------------------------------------------
CC				=	$(CROSS_PREFIX)-gcc
CXX			 	=	$(CROSS_PREFIX)-g++
AR				=	$(CROSS_PREFIX)-ar rc
AR2				=	$(CROSS_PREFIX)-ranlib
RANLIB			=	$(CROSS_PREFIX)-ranlib
LD				=	$(CROSS_PREFIX)-ld
NM				=	$(CROSS_PREFIX)-nm
STRIP			=	$(CROSS_PREFIX)-strip
OBJCOPY		 	=	$(CROSS_PREFIX)-objcopy
CP	= cp
MV	= mv
#--------------------------------------------------------------------

all : $(TARGET)
	cp $^ $(CP_DIR)

$(TARGET) : $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(LIBS) 
	$(NM) $(TARGET) > $(TARGET).map

%.o:%.c
	@echo "Compiling $< ..."
	$(CC) -c $(CFLAGS) -o $@ $<

%.o:%.cc
	@echo "C++ compiling $< ..."
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

dep :
	$(CC)	-M	$(INCLUDEDIRS)	$(SRCS) > .depend

clean:
	rm -f *.bak
	rm -f *.map
	rm -f *.o
	rm -f $(OBJS)
	rm -f $(TARGET) core

distclean: clean
	rm -rf .depend	


ifeq (.depend,$(wildcard .depend))
include .depend
endif
