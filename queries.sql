/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals;
SELECT * from animals where name like '%mon';
SELECT name from animals WHERE date_of_birth >='2016-01-01' and date_of_birth<='2019-12-31';
SELECT name from animals where neutered=true and escape_attempts <3;
SELECT date_of_birth from animals where name = 'Agumon' or  name = 'Pikachu';
SELECT name, escape_attempts from animals where weight_kg >10.5;
SELECT * from animals where neutered = true;
SELECT * from animals where name !='Gabumon';
SELECT * from animals where weight_kg between 10.4 and 17.3;
-- Transaction section
BEGIN TRANSACTION;
ALTER TABLE animals ALTER COLUMN species SET DEFAULT 'unspecified';
ROLLBACK TRANSACTION;
-- TRANSACTION TWO
BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'digimon' WHERE name LIKE '';
COMMIT TRANSACTION;
-- TRANSACTION THREE
BEGIN TRANSACTION;
delete from animals;
ROLLBACK TRANSACTION;
-- TRANSACTION FOUR
BEGIN TRANSACTION
DELETE FROM animals WHERE date_of_birth >='2022-01-01';
SAVEPOINT SP1;
update animals SET weight_kg = weight_kg *-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg *-1;
COMMIT TRANSACTION;
-- AGGREGATE SECTION
SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE escape_attempts =0;
SELECT AVG(weight_kg) FROM animals;
SELECT species, max(weight_kg), min(weight_kg) FROM animals GROUP BY species;
SELECT neutered, max(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, avg(escape_attempts) FROM animals WHERE date_of_birth >='1990-01-01'
AND date_of_birth <='2000-12-31' group by species;

-- inserting species to our animals table
update animals SET species_id=2 where name like '%mon';
update animals SET species_id=1 where name not like '%mon';

-- QUERIES FROM FOREIGN AND PROMAY KEY LESSONS
select o.full_name,a.name,a.escape_attempts,a.neutered,a.weight_kg
from owners o,animals a where o.id=a.owner_id and o.full_name='Melody Pond';

select s.name,a.name,a.escape_attempts,a.neutered,a.weight_kg 
from species s,animals a where s.id=a.species_id and s.name='Pokemon';

select o.full_name,a.name,a.escape_attempts,a.neutered,a.weight_kg 
from owners o,animals a where o.id=a.owner_id or a.owner_id=null;

select a.species_id,count(a.id) from animals a group by a.species_id;

select o.full_name,s.name,a.name,a.escape_attempts,a.weight_kg 
from species s, owners o,animals a 
where o.id=a.owner_id and o.full_name='Jennifer Owl' and s.id=a.species_id and s.name='Digimon';

select o.full_name,s.name,a.name,a.escape_attempts,a.weight_kg 
from species s, owners o,animals a 
where o.id=a.owner_id and o.full_name='Dean Whinchester' and a.escape_attempts=0;

select a.owner_id,max(a.id) from animals a group by a.owner_id;

-- ANALYSIS QUERY FOR MULTIPLE RELATIONSHIPS
select * from animals a 
-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' 
ORDER BY visits.date_of_visit DESC;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(animals.name) FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets  ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
select vets.name,vets.date_of_graduation,species.name from vets 
join specializations sp on vets.id=sp.vets_id 
join species on sp.species_id=species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets ON vets.id = visits.vets_id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.date_of_visit) FROM animals 
INNER JOIN visits ON visits.animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(*) DESC;

-- Who was Maisy Smith's first visit?
SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets  ON vets.id = visits.vets_id 
WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC;

-- Details for most recent visit: animal information, vet information, and date of visit
 SELECT visits.date_of_visit, animals.name, animals.escape_attempts,
 animals.neutered, animals.weight_kg, vets.name, vets.age, vets.date_of_graduation FROM animals 
 INNER JOIN visits ON visits.animal_id = animals.id 
 INNER JOIN vets  ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC;

-- How many visits were with a vet that did not specialize in that animal's species?  
SELECT vets.name, species.name, COUNT(visits.date_of_visit) AS total_visits FROM specializations 
RIGHT JOIN vets ON specializations.vets_id = vets.id 
LEFT JOIN species ON species.id = specializations.species_id 
INNER JOIN visits ON visits.vets_id = vets.id 
WHERE species.name IS NULL GROUP BY vets.name, species.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(visits.animal_id), species.name, vets.name FROM visits 
INNER JOIN animals ON visits.animal_id = animals.id 
INNER JOIN species ON species.id = animals.species_id 
INNER JOIN vets ON vets.id = visits.vets_id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name, vets.name;