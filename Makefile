VERSION?='latest'

.PHONY: all
all: debian8 debian9

.PHONY: alpine
alpine:
	docker build --tag askap-alpine:$(VERSION) --file ./Dockerfile-alpine .

.PHONY: debian8-base
debian8-base:
	docker build --tag askap-debian8-base:$(VERSION) --file ./Dockerfile-debian8-base .

.PHONY: debian8
debian8: debian8-base
	docker build --tag askap-debian8:$(VERSION) --file ./Dockerfile-debian8 .

.PHONY: binary
binary:
	docker build --tag askap-binary:$(VERSION) --file ./Dockerfile-debian8-binary .

.PHONY: debian9-base
debian9-base:
	docker build --tag askap-debian9-base:$(VERSION) --file ./Dockerfile-debian9-base .

.PHONY: debian9
debian9: debian9-base
	docker build --tag askap-debian9:$(VERSION) --file ./Dockerfile-debian9 .
