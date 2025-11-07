#!/bin/sh

if [ -f db/atlas.duckdb ]; then
	rm db/atlas.duckdb
fi
./bin/duckdb/duckdb db/atlas.duckdb < db/sql/load-csv.sql

./bin/ontop/ontop materialize \
  -p db/atlas.properties \
  -m src-gen/mapping-stops.r2rml.ttl \
  -f turtle \
  -o output/stops-and-organizations.ttl

