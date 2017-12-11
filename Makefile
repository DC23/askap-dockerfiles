export VERSION?='latest'

.PHONY: debian8
debian8:
	$(MAKE) -C debian8

.PHONY: debian9
debian9:
	$(MAKE) -C debian9

.PHONY: gui-dev-deb8
gui-dev-deb8: debian8
	$(MAKE) -C gui-dev-deb8

.PHONY: gui-dev-deb9
gui-dev-deb9: debian9
	$(MAKE) -C gui-dev-deb9

.PHONY: arch
arch:
	$(MAKE) -C arch

.PHONY: alpine
alpine:
	$(MAKE) -C alpine

.PHONY: binary8
binary8:
	$(MAKE) -C binary-deb8

.PHONY: binary9
binary9:
	$(MAKE) -C binary-deb9

.PHONY: gcc5
gcc5:
	$(MAKE) -C gcc-5

.PHONY: gcc6
gcc6:
	$(MAKE) -C gcc-6

.PHONY: gcc7
gcc7:
	$(MAKE) -C gcc-7

all: debian8 debian9 gui-dev-deb8 gui-dev-deb9 arch binary8 binary9 gcc5 gcc6 gcc7
