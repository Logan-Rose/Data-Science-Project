docker exec -t -i somepostgres /bin/bash -c "cd seeds; rm *; cd ..; rmdir seeds"

docker exec -ti somepostgres psql -U postgres -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
