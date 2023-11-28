SHELL:=/bin/bash
include .env

VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init  && $(TERRAFORM) validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/all >./modules/all/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/boundary >./modules/boundary/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/iam >./modules/iam/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/terraform >./modules/terraform/README.md

format:
	$(TERRAFORM) fmt -list=true -recursive

release: test
	git tag $(VERSION) && git push --tags
