# Health outcomes datamart

## Setting up the Project

  1. Open the ```seed_generate.ipynb``` Jupyter notebook. Run all the cells (should take around 1 minute), this file is responsible for all data staging, and is seperated into differnt code blocks for each step of the staging process.
  2. Use docker to create and run a PostgreSQL Database server
  3. Assign the name of this database to the ```db``` variable at the top of the init.sh file
  4. Execute the initialization script by running ```bash data-mart/init.sh``` This script copies all the data from the generated seed files to the postgreSQL Database