#!/bin/bash

# Run this script from the projects root directory using docker as follows:
# $ docker run --rm -it -v $(pwd):/app zazukoians/node-java-jena:v6 ./scripts/validate-zoning-and-transport.sh

mkdir -p output-validation

shacl v \
  --data output/zoning-and-transport.ttl \
  --shapes shapes/zoning-and-transport-shapes.ttl \
  > output-validation/validation-result-report-zoning-and-transport.ttl

arq --data output-validation/validation-result-report-zoning-and-transport.ttl \
  "ASK { [ <http://www.w3.org/ns/shacl#conforms> true ] }" \
  | grep "Ask =>"