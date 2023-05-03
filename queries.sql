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

select neutered, MAX(escape_attempts) from animals 
group by neutered;

select species, MIN( weight_kg ), MAX( weight_kg ) from animals 
group by species;

select species ,AVG( escape_attempts ) from animals
where date_of_birth between '1990-1-1' and '2000-12-31'
group by species;

select animals.name from animals
join owners on animals.owner_id = owners.id
where owners.full_name = 'Melody Pond';

select animals.name from animals
join species on animals.species_id = species.id
where species.name = 'Pokemon';

select owners.name , animals.name from owners
left join animals on owner_id.id = animals.owner_id;

select species.name, count( animals.id ) from species
join animals on species.id = animals.species_id
group by species.name;

select animals.name from animals
join owners on animals.owner_id = owner_id.id
join species on animals.species_id = species.id
where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';

select animals.name from animals
join owners on animals.owner_id = owners.id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;

select owners.full_name , count(animals.id) from owners
join animals on animals.owner_id = owners.id
group by owners.full_name;

select * from visits
where vet_id = (select id from vets where vets.name = 'William Tatcher')
order by visit_date desc
limit 1;

select count(distinct animal_id) from visits
where vet_id = ( select id from vets where vets.name = 'Stephanie Mendez' );

select vets.name , species.name from specialization
left join species on species.id = specialization.species_id
left join vets on vets.id = specialization.vet_id;

select animals.name from visits
join animals on animals.id = visits.animal_id
where visits.vet_id = ( select id from vets where vets.name = 'Stephanie Mendez' )
and visits.visit_date >= '2020-04-01'
and visits.visit_date <= '2020-08-30';

select animals.name, count(*) as visit_count from visits
join animals on animals.id = visits.animal_id
group by animals.name
order by visit_count
limit 1;

select animals.name , visits.visit_date from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name = 'Maisy Smith'
order by visits.visit_date
limit 1;

select animals.*, vets.*, visits.visit_date from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
order by visits.visit_date desc
limit 1;

select count(*) from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
LEFT join specialization on vets.id = specialization.vet_id and animals.species_id = specialization.species_id
where specialization.id IS NULL;

SELECT species.name, COUNT(*) FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(*) DESC
LIMIT 1;