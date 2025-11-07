#!/bin/sh

java -jar bin/shacl-play/shacl-play-app-X.Y.Z-onejar.jar doc \
  -i shapes/stops-and-organizations-shapes.ttl \
  -i shapes/zoning-and-transport-shapes.ttl \
  -o docs/datamodel.html \
  --language en