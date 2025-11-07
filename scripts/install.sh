#!/bin/sh

DUCKDB_ZIPFILE_URL="https://github.com/duckdb/duckdb/releases/download/v1.4.1/duckdb_cli-linux-amd64.zip"
DUCKDB_JDBC_JARFILE_URL="https://repo1.maven.org/maven2/org/duckdb/duckdb_jdbc/1.4.1.0/duckdb_jdbc-1.4.1.0.jar"

ONTOP_ZIPFILE_URL="https://github.com/ontop/ontop/releases/download/ontop-5.3.1/ontop-cli-5.3.1.zip"

CARML_JARFILE_URL="https://github.com/carml/carml-jar/releases/download/v1.4.0/carml-jar-rdf4j-1.4.0-0.4.11.jar"

SHACLPLAY_JARFILE_URL="https://github.com/sparna-git/shacl-play/releases/download/0.11.2/shacl-play-app-0.11.2-onejar.jar"

mkdir -p bin/duckdb
curl -L $DUCKDB_ZIPFILE_URL -o duckdb_cli.zip
unzip duckdb_cli.zip -d bin/duckdb
rm duckdb_cli.zip

mkdir -p bin/ontop
curl -L $ONTOP_ZIPFILE_URL -o ontop_cli.zip
unzip ontop_cli.zip -d bin/ontop
rm ontop_cli.zip

curl -L $DUCKDB_JDBC_JARFILE_URL -o duckdb_jdbc.jar
mv duckdb_jdbc.jar bin/ontop/jdbc/

mkdir -p bin/carml
curl -L $CARML_JARFILE_URL -o carml-jar-rdf4j.jar
mv carml-jar-rdf4j.jar bin/carml/

mkdir -p bin/shacl-play
curl -L $SHACLPLAY_JARFILE_URL -o shacl-play-app-X.Y.Z-onejar.jar
mv shacl-play-app-X.Y.Z-onejar.jar bin/shacl-play/