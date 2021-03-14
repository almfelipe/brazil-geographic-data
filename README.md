# brazil-geographic-data
This is a database of Brazilian regions, states, and cities containing names and geographic boundaries of each of those entities. The geographic boundaries are storage as Longtext and Geometry datatypes of MySql Database 5.7. All data were extracted from [IBGE (Brazilian Institute of Geography and Statistics) API](https://servicodados.ibge.gov.br/api/docs/malhas?versao=3).

### Built with
* [Sql/MySql](https://www.mysql.com/)

## Database structure

This database contains five tables: region, state, city, and geometry. Each one of those tables is described in the sections below.

### Table region

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id`                  | INT(10)         | The unique identifier same as used by IBGE.                                                                                  |
| `name`                | VARCHAR(16)     | The region's name.                                                                                                           |

### Table state

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id`                  | INT(10)         | The unique identifier same as used by IBGE.                                                                                  |
| `id_region`           | INT(10)         | The foreign key for the state's region.                                                                                      |
| `initials`            | VARCHAR(2)      | The state's name abreviattion.                                                                                               |
| `name`                | VARCHAR(32)     | The state's name.                                                                                                            |
| `area`                | DOUBLE          | The state's area (Km²).                                                                                                      |
| `order_map`           | INT(1)          | The order (layer number) to print the state on the map. A high layer needs to be printed over a lower layer.                 |
| `latitude`            | DOUBLE          | The state's latitude.                                                                                                        |
| `longitude`           | DOUBLE          | The state's longitude.                                                                                                       |

### Table city

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id`                  | INT(10)         | The unique identifier same as used by IBGE.                                                                                  |
| `id_region`           | INT(10)         | The foreign key for the city's region.                                                                                       |
| `id_state`            | INT(10)         | The foreign key for the city's state.                                                                                        |
| `name`                | VARCHAR(64)     | The city's name.                                                                                                             |
| `capital`             | VARCHAR(1)      | `N` value: is not capital. `E` value: state's capital. `F` value: country's capital.                                         |
| `order_map`           | INT(1)          | The order (layer number) to print the city on the map. A high layer needs to be printed over a lower layer.                  |
| `latitude`            | DOUBLE          | The city's latitude.                                                                                                         |
| `longitude`           | DOUBLE          | The city's longitude.                                                                                                        |
| `altitude`            | INT(11)         | The city's altitude (m).                                                                                                     |
| `area`                | DOUBLE          | The state's area (Km²).                                                                                                      |


### Table geometry

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id`                  | INT(10)         | `id_region` value for region's boundary. `id_state` value for state's boundary. `id_city` value for state's boundary.        |
| `id_region`           | INT(10)         | The foreign key for the geometry's region.                                                                                   |
| `id_state`            | INT(10)         | The foreign key for the geometry's state.                                                                                    |
| `id_city`             | INT(10)         | The foreign key for the geometry's state.                                                                                    |
| `type`                | VARCHAR(16)     | The geometry's type (Polygon or MultiPolygon).                                                                               |
| `shape`               | LONGTEXT        | The entity's boundary expressed in a latitude-longitude collection.                                                          |
| `shape_geometry`      | GEOMETRY        | The same information as `shape` in [Geometry](https://dev.mysql.com/doc/refman/5.7/en/spatial-type-overview.html) data type. |

## Getting started

To get a local copy up and running follow these simple steps.

### Prerequisites

Make sure you have MySQL Community Server 5.7 installed in your development environment.

### Clone the repository
```
git clone https://github.com/almfelipe/brazil-geographic-data.git
```

### Create database
```sql
create database your_dabase_name;
```

### Load data

Execute scripts in the following order.  

```
./src/create_tables.sql
./src/data/data_region.sql
./src/data/data_state.sql
./src/data/data_city.sql
./src/data/data_geometry.sql
```