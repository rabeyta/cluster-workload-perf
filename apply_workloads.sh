#!/usr/bin/env bash

namespaces=(dev unicorn robert demos bob)
OUTPUT_FOLDER="workloads"

for ns in "${namespaces[@]}"; do
  kubectl apply -f "$OUTPUT_FOLDER/$ns"
done