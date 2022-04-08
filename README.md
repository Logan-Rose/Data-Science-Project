# World Bank Information Data Mart

## Repository Structure

- `/data` contains the original source data for the data mart
  - Metadata about external data sources can be found in the `/data/sources.csv`  file.
- `/data-mart` contains the Scripts used to initilize the data mart, as well as the OLAP queries written to execute on the data mart
- `/data-mining` contains the Jupyter notebooks used to explore tha data, and perform data mining operations
- `/deprecated` contains files that were used at some poiunt in the project, but are not currently in use
- `/seeds` contains the seed files for  the data mart that are generated using the `seed_generate.ipynb` notebook.

## Setting up the Project

  1. Open the `seed_generate.ipynb` Jupyter Notebook. Run all the cells (should take around 1 minute), this file is responsible for all data staging, and is separated into different code blocks for each step of the staging process.
  2. Use docker to create and run a PostgreSQL Database server.
  3. Initilizing the data mart:
     1. For UNIX Systems
        1. Assign the name of your docker server to the `db` variable at the top of the `/data-mart/init.sh` file.
        2. Execute the initialization script by running `bash data-mart/init.sh` This script copies all the data from the generated seed files to the postgreSQL Database.
        3. In the event you wish to wipe the contents of the database, simply run `bash data-mart/`
     2. For Windows systems:
        1. Assign the name of your docker server to the `db` variable at the top of the `/data-mart/init.bat` and `data-mart/refresh.bat` files.
        2. Navigate to the `data-mart` directory by executing `cd data-mart`
        3. Execute the initialization script by running `init.bat` This script copies all the data from the generated seed files to the postgreSQL Database.
        4. In the event you wish to wipe the contents of the database, simply run `refresh.bat`

This data mart was created By Logan Rose, Lilian Ly, and Jonathan Brar for CSI4106 at The University of Ottawa in Winter 2022.
