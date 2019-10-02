SUBDIRS=app \
	sample \

all:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

clean:
	for dir in $(SUBDIRS); do \
		echo $$dir; \
	done


