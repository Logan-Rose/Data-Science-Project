#!/usr/bin/env bash

db="some-postgres"

# Move the Seed Files from the seeds directory to the /seeds directory in the docker container
docker exec -t -i $db /bin/bash -c "mkdir seeds"
cd seeds
load_file () {
  arr=(${1//_/ })
  echo ${arr[0]}
  docker cp $1 some-postgres:./seeds/
}
for FILE in *;
do
  load_file $FILE
  echo $FILE;
done

# Mode the SQL Files to the /scripts directory in the docker container
docker cp ../data-mart/init.sql $db:./seeds/

#Create Tables
docker exec -ti $db psql -U postgres -c "\i ./seeds/init.sql"
# Populate Tables with seed data
docker exec -ti $db psql -U postgres -c "\copy Country FROM ./seeds/countries_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Month FROM ./seeds/date_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Education FROM ./seeds/Education_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Health FROM ./seeds/Health_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Quality_of_Life FROM ./seeds/Quality_of_life_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Population FROM ./seeds/Population_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Event FROM ./seeds/Events_seed.csv delimiter ',' CSV HEADER"
docker exec -ti $db psql -U postgres -c "\copy Fact FROM ./seeds/Facts.csv delimiter ',' CSV HEADER"
