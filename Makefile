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

.PHONY: alpine
alpine:
	$(MAKE) -C alpine

.PHONY: binary
binary:
	$(MAKE) -C binary

.PHONY: gcc5
gcc5:
	$(MAKE) -C gcc-5

.PHONY: gcc6
gcc6:
	$(MAKE) -C gcc-6

.PHONY: gcc7
gcc7:
	$(MAKE) -C gcc-7
