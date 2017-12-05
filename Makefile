.PHONY: all
all: debian8 debian9

.PHONY: debian8-base
debian8-base:
	docker build --tag askap-debian8-base --file ./Dockerfile-debian8-base .

.PHONY: debian8
debian8: debian8-base
	docker build --tag askap-debian8 --file ./Dockerfile-debian8 .

.PHONY: debian9-base
debian9-base:
	docker build --tag askap-debian9-base --file ./Dockerfile-debian9-base .

.PHONY: debian9
debian9: debian9-base
	docker build --tag askap-debian9 --file ./Dockerfile-debian9 .
