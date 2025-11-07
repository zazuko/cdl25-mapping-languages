#!/bin/sh

if [ -f db/atlas2.duckdb ]; then
	rm db/atlas2.duckdb
fi
./bin/duckdb/duckdb db/atlas2.duckdb < db/sql/load-csv.sql

./bin/ontop/ontop endpoint \
  -p db/atlas.properties \
  -m src-gen/mapping-stops.r2rml.ttl