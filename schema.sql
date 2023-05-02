/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int not null identity(1,1)
    primary key(id),
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg real
);

alter table animals
add column species varchar(100);