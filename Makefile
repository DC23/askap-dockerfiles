export VERSION?='latest'

.PHONY: all
all: debian8 debian9 gui-dev

.PHONY: debian8
debian8:
	$(MAKE) -C debian8

.PHONY: debian9
debian9:
	$(MAKE) -C debian9

.PHONY: gui-dev
gui-dev:
	$(MAKE) -C gui-dev

.PHONY: alpine
alpine:
	$(MAKE) -C alpine

.PHONY: binary
binary:
	$(MAKE) -C binary

.PHONY: gcc5
gcc5:
	$(MAKE) -C gcc5

.PHONY: gcc6
gcc6:
	$(MAKE) -C gcc6

.PHONY: gcc7
gcc7:
	$(MAKE) -C gcc7
