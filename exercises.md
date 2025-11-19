# Activities & Exercises

## Directory structure

Where to find what

```
.
├── input               Input data  (XML, CSV)
├── output              Output data (RDF Turtle)
|
├── mappings            XRM mappings, for editing
├── src-gen             Generated R2RML/RML mappings, for running transformations
|
├── shapes              SHACL shapes, for validation and documentation
├── output-validation   SHACL validation reports
|
├── docs                SPARQL Notebook and datamodel documentation
|
└── scripts             Shellscripts to run transformation, validation, ...
```


## Activities

*Note:* The [Scripts](./README.md#scripts) section in the [README](./README.md) can serve as an introduction to the scripts

- Run mapping and validation for both of the examples using the `./scripts`
- Starting from the scripts, look at which files are involved and think about what role they play in the process
- Run the queries in the sparqlbook `docs/queries.sparqlbook`
- Look at the datamodel documentation `docs/datamodel.html` that is generated from the SHACL shapes 


## Exercises

The following exercises are all based on the first example, the one transforming XML input.

*Note:* After adjusting the mappings, the shapes may need to be adjusted as well in order to keep the validation step succeeding.


### Exercise 1

The Zone has a link to the ZoningPlan and the ZoningPlan has a link to the Alliance.

- Introduce a new direct link from the Zone to the Alliance in the mapping
- After running the modified mapping, you can verify your change by running the `DESCRIBE` query for the zone in the SPARQL Notebook
- Because the `ZoneShape` is closed, validation will fail and you will also need to adjust the `ZoneShape` accordingly to make it pass again


### Exercise 2

On the transport edges, the meanOfTransport is mapped as a string (the object of the triple is `"bus"` or `"bahn"`)

- Change this in the mapping, so that the object of the triple is a NamedNode (an IRI like `http://example.org/mean-of-transport/bus`)
- After running the modified mapping, you can verify your changes by running the `DESCRIBE` query for the transport edge in the SPARQL Notebook
- *Note:* The query for transport-edges (the last query in the notebook) will also need minor modification to keep showing the meansOfTransport in the result table


### Exercise 3

Assuming we want to type transport edges for buses not only as `otd.TransportEdge` but additionally also with a more specific class `otd.BusTransportEdge`.

- For this, add a new source `transport.bus_edge` in *sources.xrm* and use a XPath expression for the iterator that only matches edges for buses
- Add a new class `otd.BusTransportEdge` in *vocabularies.xrm* and add the necessary mapping
- Write a query that returns bus edges based on their type beeing `otd.BusTransportEdge` and see if you get back six edges