#!/bin/bash

# Run this script from the projects root directory using docker as follows:
# $ docker run --rm -it -v $(pwd):/app zazukoians/node-java-jena:v6 ./scripts/validate-stops-and-organizations.sh

mkdir -p output-validation

shacl v \
  --data output/stops-and-organizations.ttl \
  --shapes shapes/stops-and-organizations-shapes.ttl \
  > output-validation/validation-result-report-stops-and-organizations.ttl

arq --data output-validation/validation-result-report-stops-and-organizations.ttl \
  "ASK { [ <http://www.w3.org/ns/shacl#conforms> true ] }" \
  | grep "Ask =>"