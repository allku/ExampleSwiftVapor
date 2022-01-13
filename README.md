# ExampleSwiftVapor
Example with Swift and Vapor

## Requirements
* Swift 5.5.1
* Postgres 12
* Vapor 4.0.0

## Create database
### GNU/Linux
```console
sudo su - postgres
createdb eswiftvapor
createuser jojelu
psql
grant all privileges on database eswiftvapor to jojelu;
alter user jojelu with encrypted password 'j';
```

### MacOS with Postgres.app
```console
createdb eswiftvapor
createuser jojelu
psql
grant all privileges on database eswiftvapor to jojelu;
alter user jojelu with encrypted password 'j';
```
## Migrate to database
```
vapor run migrate
```
## Revert migration database
```
vapor run migrate --revert
```
## List route
```console
vapor run routes
```

## Run
```console
vapor run serve
```

## Test
Use HTTPie
https://httpie.io/

### POST
```console
http POST http://127.0.0.1:8080/api/rest/v1/books < files/new_book.json
```
### GET
```console
http http://127.0.0.1:8080/api/rest/v1/books
```
### PUT
```console
http PUT http://127.0.0.1:8080/api/rest/v1/books/1 < files/update_book.json
```
### GET
```console
http http://127.0.0.1:8080/api/rest/v1/books
```
### DELETE
```console
http DELETE http://127.0.0.1:8080/api/rest/v1/books/1
```
