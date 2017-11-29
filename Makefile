CFN_NAG_VERSION = 0.3.11
IMAGE_NAME ?= amaysim/cfn-nag:$(CFN_NAG_VERSION)
TAG = $(CFN_NAG_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v "$(pwd):/work:Z" --entrypoint=sh $(IMAGE_NAME)

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
