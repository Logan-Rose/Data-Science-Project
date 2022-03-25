docker exec -t -i some-postgres /bin/bash -c "cd seeds; rm *; cd ..; rmdir seeds"

docker exec -ti some-postgres psql -U postgres -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
