export VERSION?='latest'

.PHONY: all
all: debian8

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
