/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int not null identity(1,1),
    primary key(id),
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg real
);

alter table animals
add column species varchar(100);

create table owners (
    id serial primary key,
    full_name varchar(100),
    age int
);

create table species (
    id serial primary key,
    name varchar(100)
);

alter table animals
add column species_id int references species(id),
add column owner_id int references owners(id),
drop column species,
add primary key (id);