#!/usr/bin/env bash

namespaces=(dev unicorn robert demos bob)
OUTPUT_FOLDER=$1

for ns in "${namespaces[@]}"; do
  kubectl apply -f "$OUTPUT_FOLDER/$ns"
done