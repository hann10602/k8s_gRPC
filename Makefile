postgres:
	docker run --name mypostgres -p 5432:5432 -e POSTGRES_PASSWORD=123456 -d postgres:12-alpine

createdb:
	docker exec -it mypostgres createdb --username=postgres --owner=postgres k8s_grpc

dropdb:
	docker exec -it mypostgres dropdb --username=postgres k8s_grpc

migrateup:
	migrate -path db/migration -database "postgresql://postgres:123456@localhost:5432/k8s_grpc?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:123456@localhost:5432/k8s_grpc?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test