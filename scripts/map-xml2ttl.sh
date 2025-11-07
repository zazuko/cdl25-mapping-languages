#!/bin/sh

java -jar bin/carml/carml-jar-rdf4j.jar map \
  -rsl input \
  -m src-gen/mapping-zoningplan.rml.ttl \
  -m src-gen/mapping-transport.rml.ttl \
  -b https://lod.opentransportdata.swiss/ \
  -p rdf,rdfs,owl,sh,dcterms,geo,wgs,gtfs,otd,schema,ch \
  -pm prefix-mappings/pm.yaml \
  -P -of ttl \
  -o output/zoning-and-transport.ttl