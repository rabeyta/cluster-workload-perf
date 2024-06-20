#!/usr/bin/env bash

sed=gsed

TEMPLATE=$1
NUMBER_OF_WORKLOADS=$2
OUTPUT_FOLDER="catalogs"

for ((i=1; i<=NUMBER_OF_WORKLOADS; i++)); do
    OUTPUT_WORKLOAD="$OUTPUT_FOLDER/workload-$i.yaml"
    mkdir -p "$OUTPUT_FOLDER/$ns"
    cp "$TEMPLATE" "$OUTPUT_WORKLOAD"
    $sed -i "s/WORKLOAD_NAME_PLACEHOLDER/workload-$i/g" "$OUTPUT_WORKLOAD"
done