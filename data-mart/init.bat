@REM !/usr/bin/env bash

set db=some-postgres

@REM Move the Seed Files from the seed_data directory to the /seeds directory in the docker container

cd ..
docker cp seeds %db%:./
cd data-mart
docker cp ./init.sql %db%:./seeds/

docker exec -ti %db% psql -U postgres -c "\i ./seeds/init.sql"
@REM Populate Tables with seed data
docker exec -ti %db% psql -U postgres -c "\copy Country FROM ./seeds/countries_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Month FROM ./seeds/date_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Education FROM ./seeds/Education_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Health FROM ./seeds/Health_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Quality_of_Life FROM ./seeds/Quality_of_life_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Population FROM ./seeds/Population_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Event FROM ./seeds/Events_seed.csv delimiter ',' CSV HEADER"
docker exec -ti %db% psql -U postgres -c "\copy Fact FROM ./seeds/Facts.csv delimiter ',' CSV HEADER"
