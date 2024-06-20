
WORKLOADS_TO_GENERATE_PER_NS ?= 1
WORKLOAD_OUTPUT_FOLDER ?= workloads
WORKLOAD_TEMPLATE ?= "templates/service-with-db.yaml"
CATALOG_OUTPUT_FOLDER ?= catalogs
CATALOG_TEMPLATE ?= "templates/catalog.yaml"

.PHONY: apply
apply: ## Apply generated workloads
	./apply_workloads.sh $(WORKLOAD_OUTPUT_FOLDER)

.PHONY: delete
delete: ## Delete generated workloads
	./delete_workloads.sh $(WORKLOAD_OUTPUT_FOLDER)

.PHONY: cleanup
cleanup: ## Cleanup generated workloads
	rm -rf $(WORKLOAD_OUTPUT_FOLDER)
	rm -rf $(CATALOG_OUTPUT_FOLDER)

.PHONY: generate
generate: cleanup catalogs## generate workloads
	./generate_workloads.sh $(WORKLOAD_TEMPLATE) $(WORKLOADS_TO_GENERATE_PER_NS)

.PHONY: catalogs
catalogs: ## generate catalogs
	./generate_catalogs.sh $(CATALOG_TEMPLATE) $(WORKLOADS_TO_GENERATE_PER_NS)


# Based on http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Print help for each make target
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
