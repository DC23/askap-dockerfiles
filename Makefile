.PHONY: all
all: debian8

.PHONY: debian8-base
debian8-base:
	docker build --tag askap-debian8-base --file ./Dockerfile-debian8-base .

.PHONY: debian8
debian8: debian8-base
	docker build --tag askap-debian8 --file ./Dockerfile-debian8 .
