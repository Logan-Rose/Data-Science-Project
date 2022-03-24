# Health outcomes datamart

## Repository Structure

### DB initilization scripts

- All of the SQL Queries to initilize the database can be found in ```/data-mart/init.sql```.
- The source data from the seed files is loaded into the database using the ```/data-mart/ init.sh``` Script file.

### Original Source Data

- The original source data, can be found in the ```/data``` directory.
- Metadata about external data sources can be found in the ```/data/sources.csv```  file..

### Perpared Seed Data

- The seed data, (generated using ```seed_generate.ipynb```), can be found in the ```/seed_data``` folder
 
## Setting up the Project

  1. Open the ```seed_generate.ipynb``` Jupyter Notebook. Run all the cells (should take around 1 minute), this file is responsible for all data staging, and is separated into different code blocks for each step of the staging process.
  2. Use docker to create and run a PostgreSQL Database server.
  3. Assign the name of this database to the ```db``` variable at the top of the ```/data-mart/init.sh``` file.
  4. Execute the initialization script by running ```bash data-mart/init.sh``` This script copies all the data from the generated seed files to the postgreSQL Database.
  5. In the event you wish to wipe the contents of the database, simply run ```bash data-mart/refresh.sh```.