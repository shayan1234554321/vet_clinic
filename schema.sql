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

create table vets (
    id serial primary key,
    name varchar(100),
    age int,
    date_of_graduation date 
);

create table specialization (
    id serial primary key,
    vet_id int,
    species_id int,
    foreign key (vet_id) references vets(id),
    foreign key (species_id) references species(id)
);

create table visits (
    id serial primary key,
    animal_id int,
    vet_id int,
    visit_date date,
    foreign key (animal_id) references animals(id),
    foreign key (vet_id) references vets(id)
)