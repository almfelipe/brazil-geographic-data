# brazil-geographic-data
This is a database of Brazilian regions, states, and cities containing names and geographic boundaries of each of those entities. The geographic boundaries are storage as Longtext and Geometry datatypes of MySql Database 5.7. All data were extracted from [IBGE (Brazilian Institute of Geography and Statistics) API](https://servicodados.ibge.gov.br/api/docs/malhas?versao=3).

### Built with
* [Sql/MySql](https://www.mysql.com/)

## Database structure

This database contains five tables: region, state, city, and geometry. Each one of those tables is described in the sections below.

### Table region

| Field name            | Field Type      | Description| 
|-----------------------|-----------------|----------------------------------------------|
| `id`                  | INT(10)         | Unique identifier same as used by IBGE.      |
| `name`                | VARCHAR(16)     | Region's name                                |
