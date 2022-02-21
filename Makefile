SHELL:=/bin/bash
include .env

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/all init && $(TERRAFORM) -chdir=modules/all validate

test: validate
	$(CHECKOV) -d /work && \
		$(CHECKOV) -d /work/modules/all

docs:
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/all >./modules/all/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/boundary >./modules/boundary/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/iam >./modules/iam/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/terraform >./modules/terraform/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/all && \
		$(TERRAFORM) fmt -list=true ./modules/boundary && \
		$(TERRAFORM) fmt -list=true ./modules/iam && \
		$(TERRAFORM) fmt -list=true ./modules/terraform
