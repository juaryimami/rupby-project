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
select species, avg(escape_attempts) FROM animals WHERE date_of_birth >='1990-01-01' AND date_of_birth <='2000-12-31' group by species;