#!/usr/bin/env bash

# Move the Seed Files from the seed_data directory to the /seeds directory in the docker container
docker exec -t -i some-postgres /bin/bash -c "mkdir seeds"
cd seed_data
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
docker cp ../data-mart/init.sql some-postgres:./seeds/
docker cp ../data-mart/initial_load.sql some-postgres:./seeds/

docker exec -ti some-postgres psql -U postgres -c "\i ./seeds/init.sql"
docker exec -ti some-postgres psql -U postgres -c "\i /root/seeds/initial_load.sql"