# Creating RDF Knowledge Graphs from structured data using mapping languages

This repository provides hands-on material and the slides for the talk at [Connected Data London 2025](https://2025.connected-data.london/)

## Installation


### Visual Studio Code extensions from Marketplace

- [SPARQL Notebook](https://marketplace.visualstudio.com/items?itemName=Zazuko.sparql-notebook) (zazuko.sparql-notebook) 
- [RDF Sketch](https://marketplace.visualstudio.com/items?itemName=Zazuko.vscode-rdf-sketch) (zazuko.vscode-rdf-sketch)


### Java runtime environment (JRE)

Java runtime environment (JRE) version 17 or newer is required to run the Expressive RDF Mapper (XRM) extension, Ontop and SHACL Play!

Make sure that the `java` runtime is visible on the path. This can be checked by typing `java -version` in the shell (terminal). Those who do not have a JRE installed can get one from [Adoptium](https://adoptium.net/).


### Expressive RDF Mapper (XRM)

A Java runtime environment (JRE) is required to run this extension in Visual Studio Code (with `java` runtime visible on the path).

The [XRM extension](https://github.com/zazuko/expressive-rdf-mapper) is not published in the Marketplace and needs to be downloaded and installed as follows:

1. Download the extension: <https://download.zazukoians.org/expressive-rdf-mapper/expressive-rdf-mapper-1.6.0.vsix>
1. Open Visual Studio Code and navigate to the "Extensions" (select View > Extensions from the menu).
1. Top-right corner of the "Extensions" pane, use the `...` button and choose "Install from VSIX…".
1. Select the `.vsix` file you downloaded, click *Install*.

The extension will detect and handle `.xrm` mapping files.

Details of editor issues are shown in the problems view. Use `View > Problems (Ctrl-Shift-M)` to activate it.


### DuckDB, Ontop, CARML and SHACL Play!

There is a script to download DuckDB CLI and JDBC Driver, Ontop CLI, CARML CLI and SHACL Play! - and unpack into *bin* folder.

- [DuckDB](https://github.com/duckdb/duckdb)
- [Ontop](https://github.com/ontop/ontop)
- [CARML](https://github.com/carml/carml-jar)
- [SHACL Play!](https://github.com/sparna-git/shacl-play)

*Note:* If you are not on `linux-amd64`, you will have to edit the script and modify `DUCKDB_ZIPFILE_URL` to download the right [asset](https://github.com/duckdb/duckdb/releases) for your OS and architecture, before running the script.

```
$ ./script/install.sh
```

### Docker

The scripts for SHACL validation use the Apache Jena binaries from the [zazukoians/node-java-jena](https://github.com/zazukoians/docker-node-java-jena) docker image.

- [Get Started with Docker](https://www.docker.com/get-started/)


## Scripts

The directory `scripts` contains shellscripts that run the CLI actions.

**Important:** All scripts need to be run from the project root directory (eg. `./scripts/map-xml2ttl.sh`)


To transform XML input to Turtle output, run:

```sh
./scripts/map-xml2ttl.sh
```

- Input data: `input/zoning-and-transport.xml`
- Processing: RML mapping with CARML engine
- Output data: `output/zoning-and-transport.ttl`

-----

To validate the Turtle output generated from XML, run:

```sh
docker run --rm -it -v $(pwd):/app zazukoians/node-java-jena:v6 ./scripts/validate-zoning-and-transport.sh
```

- Input data: `output/zoning-and-transport.ttl`
- Processing: SHACL shapes with Apache Jena SHACL engine
- Output report: `output-validation/validation-result-report-zoning-and-transport.ttl`

-----

To convert CSV input to Turtle output, run:

```sh
./scripts/map-csv2ttl.sh
```

- Input data: `input/service_points.csv`
- Processing: R2RML mapping with DuckDB and Ontop engine
- Output data: `output/stops-and-organizations.ttl`

-----

To validate the Turtle output generated from CSV, run:

```sh
docker run --rm -it -v $(pwd):/app zazukoians/node-java-jena:v6 ./scripts/validate-stops-and-organizations.sh
```

- Input data: `output/stops-and-organizations.ttl`
- Processing: SHACL shapes with Apache Jena SHACL engine
- Output report: `output-validation/validation-result-report-stops-and-organizations.ttl`

-----

To run a virtual SPARQL endpoint on the data from CSV, run:

```sh
./scripts/map-csv2endpoint.sh
```

- Input data: `input/service_points.csv`
- Processing: R2RML mapping with DuckDB and Ontop engine
- Virtual SPARQL Endpoint: http://localhost:8080/

-----

To generate documentation of the datamodel from the SHACL shapes, run:

```sh
./scripts/generate-documentation.sh
```

- Input shapes: `shapes/stops-and-organizations-shapes.ttl` and `shapes/zoning-and-transport-shapes.ttl`
- Processing: SHACL Play!
- Output HTML: `docs/datamodel.html`