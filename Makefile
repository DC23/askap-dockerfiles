export VERSION?='latest'

#.PHONY: all
#all: debian8 debian9

.PHONY: debian8
debian8:
	$(MAKE) -C debian8
