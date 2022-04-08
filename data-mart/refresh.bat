set db=somepostgres

docker exec -t -i %db% /bin/bash -c "cd seeds; rm *; cd ..; rmdir seeds"

docker exec -ti %db% psql -U postgres -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
