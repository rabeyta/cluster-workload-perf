#!/usr/bin/env bash

sed=gsed
namespaces=(dev unicorn robert demos bob)

TEMPLATE=$1
OUTPUT_FOLDER="workloads"

for ns in "${namespaces[@]}"; do
  for ((i=1; i<=10; i++)); do
      OUTPUT_WORKLOAD="$OUTPUT_FOLDER/$ns/workload-$i.yaml"
      mkdir -p "$OUTPUT_FOLDER/$ns"
      cp "$1" "$OUTPUT_WORKLOAD"
      $sed -i "s/WORKLOAD_NAME_PLACEHOLDER/workload-$i/g" "$OUTPUT_WORKLOAD"
      $sed -i "s/NAMESPACE_PLACEHOLDER/$ns/g" "$OUTPUT_WORKLOAD"
  done
done