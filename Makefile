postgres:
	docker run --name mypostgres -p 5432:5432 -e POSTGRES_PASSWORD=123456 -d postgres:12-alpine

createdb:
	docker exec -it mypostgres createdb --username=postgres --owner=postgres k8s_grpc

dropdb:
	docker exec -it mypostgres dropdb --username=postgres k8s_grpc

.PHONY: createdb