.PHONY: all
all: debian8

.PHONY: debian8-volume
debian8-volume:
	docker volume create askap-debian8
	#docker volume create askap-debian8-vim

.PHONY: debian8-base
debian8-base: debian8-volume
	docker build --tag askap-debian8-base --file ./Dockerfile-debian8-base .

.PHONY: debian8
debian8: debian8-volume debian8-base
	docker build --tag askap-debian8 --file ./Dockerfile-debian8 .
