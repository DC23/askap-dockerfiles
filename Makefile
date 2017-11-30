.PHONY: all
all: debian8 debian9

.PHONY: debian8
debian8:
	docker volume create askap-debian8
	docker build --tag askap-debian8 --file ./Dockerfile-debian8 .

.PHONY: debian9
debian9:
	docker volume create askap-debian9
	docker build --tag askap-debian9 --file ./Dockerfile-debian9 .
