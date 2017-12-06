VERSION?='latest'

.PHONY: all
all: debian8 debian9

.PHONY: alpine
alpine:
	docker build --tag askap-alpine:$(VERSION) --file ./Dockerfile-alpine .

.PHONY: debian8
debian8:
	docker build --tag askap-debian8:$(VERSION) --file ./Dockerfile-debian8 .

.PHONY: binary
binary:
	docker build --tag askap-binary:$(VERSION) --file ./Dockerfile-debian8-binary .

.PHONY: debian9
debian9:
	docker build --tag askap-debian9:$(VERSION) --file ./Dockerfile-debian9 .

.PHONY: personal
personal:
	docker build --tag askap-personal:$(VERSION) --file ./Dockerfile-personal-dev .
