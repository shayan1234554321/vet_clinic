/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select name from animals
where date_of_birth between '2016-01-01' and '2019-12-31';

select name from animals
where neutered = true and escape_attempts < 3;

select date_of_birth from animals
where name in ( 'Agumon', 'Pikachu' );

select name , escape_attempts from animals
where weight_kg > 10.5;

select * from animals
where neutered = true;

select * from animals
where name != 'Gabumon';

select * from animals
where weight_kg >= 10.4 and weight_kg <= 17.4;

begin transaction;

update animals
set species = 'unspecified';

select * from animals;

rollback;

select * from animals;

update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where species is null;

commit;

select * from animals;

begin transaction;

delete from animals;

select * from animals;

rollback;

select * from animals;

delete from animals
where date_of_birth > '2022-1-1';

savepoint before_update;

update animals
set weight_kg = weight_kg * -1;

rollback to before_update;

update animals
set weight_kg = weight_kg * -1
where weight_kg < 0;

commit;

select count(*) from animals;

select count(*) from animals 
where escape_attempts = 0;

select avg(weight_kg) from animals;

select neutered, MAX(escape_attempts) FROM animals 
GROUP BY neutered;

select species, MIN( weight_kg ), MAX( weight_kg ) from animals 
GROUP by species;

select species ,AVG( escape_attempts ) from animals
where date_of_birth between '1990-1-1' and '2000-12-31'
group by species;