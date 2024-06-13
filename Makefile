.PHONY: apply
apply: ## Apply generated workloads
	./apply_workloads.sh

.PHONY: generate
generate: ## generate workloads
	./generate_workloads.sh templates/service-with-db.yaml

# Based on http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Print help for each make target
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'