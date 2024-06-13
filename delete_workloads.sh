#!/usr/bin/env bash

namespaces=(dev unicorn robert demos bob)
OUTPUT_FOLDER="workloads"

for ns in "${namespaces[@]}"; do
  kubectl delete -f "$OUTPUT_FOLDER/$ns"
done