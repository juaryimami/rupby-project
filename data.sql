/* Populate database with sample data. */

INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (1, 'Agumon', '2020-02-03',0, true,10.23);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (2, 'Gabumon', '2018-11-15',02, true,8.0);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (3, 'Pikachu', '2021-01-7',1, false,15.04);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (4, 'Devmon', '2017-05-12',5, true,11);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (5, 'Charmander', '2020-02-08',0, false,11);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (6, 'Plantmon', '2021-11-15',2, true,5.7);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (7, 'Squirtle', '1993-04-02',3, false,12.13);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (8, 'Angemon', '2005-06-12',1, true,45);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (9, 'Boarmon', '2005-06-07',7, true,20.4);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (10, 'Blossom', '1998-10-13',3, true,17);
INSERT INTO animals (ID,NAME,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES (11, 'Ditto', '2022-05-14',4, true,22);

-- insertion to owners table
INSERT INTO owners(full_name,age) VALUES('Sam Smith',34);
INSERT INTO owners(full_name,age) VALUES('Jennifer Owl',19);
INSERT INTO owners(full_name,age) VALUES('Bob',45);
INSERT INTO owners(full_name,age) VALUES('Melody Pond',77);
INSERT INTO  owners(full_name,age) VALUES('Dean Whinchester',14);
INSERT INTO owners(full_name,age) VALUES('Jodie Whittaker',38);
-- for performance oudit
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
-- INSERTION TO SPECIES TABLE
INSERT INTO species(name) values ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

-- insertion to vets table
INSERT INTO vets(name,age,date_of_graduation) VALUES('William Tatcher',45,'2000-04-23');
INSERT INTO vets(name,age,date_of_graduation) values('Maisy Smith',26,'2019-01-17');
INSERT INTO vets(name,age,date_of_graduation) values('Stephanie Mendez',64,'1981-05-04');
insert INTO vets(name,age,date_of_graduation) values('Jack Harkness',38,'2008-06-08');

-- insertion to specialites table
insert into specializations(vets_id,species_id)values(4,2);
insert into specializations(vets_id,species_id)values(1,1);
insert into specializations(vets_id,species_id)values(3,1);
insert into specializations(vets_id,species_id)values(3,2);

-- insertion to visits table
insert into visits(vets_id,animal_id,date_of_visit) values(1,1,'2020-05-24');
insert into visits(vets_id,animal_id,date_of_visit) values(3,1,'2020-07-22');
insert into visits(vets_id,animal_id,date_of_visit) values(4,2,'2021-02-02');
insert into visits(vets_id,animal_id,date_of_visit) values(2,3,'2020-01-05');
insert into visits(vets_id,animal_id,date_of_visit) values(2,3,'2020-05-14');
insert into visits(vets_id,animal_id,date_of_visit) values(3,4,'2021-05-14');
insert into visits(vets_id,animal_id,date_of_visit) values(4,5,'2021-02-24');
insert into visits(vets_id,animal_id,date_of_visit) values(2,6,'2019-12-21');
insert into visits(vets_id,animal_id,date_of_visit) values(1,6,'2020-08-10');
insert into visits(vets_id,animal_id,date_of_visit) values(3,6,'2021-04-07');
insert into visits(vets_id,animal_id,date_of_visit) values(4,1,'2020-10-03');
insert into visits(vets_id,animal_id,date_of_visit) values(4,1,'2020-11-04');
insert into visits(vets_id,animal_id,date_of_visit) values(2,9,'2019-01-24');
insert into visits(vets_id,animal_id,date_of_visit) values(2,9,'2019-05-15');
insert into visits(vets_id,animal_id,date_of_visit) values(2,9,'2020-02-27');
insert into visits(vets_id,animal_id,date_of_visit) values(2,9,'2020-08-03');
insert into visits(vets_id,animal_id,date_of_visit) values(3,9,'2020-05-24');
insert into visits(vets_id,animal_id,date_of_visit) values(3,10,'2020-05-24');
insert into visits(vets_id,animal_id,date_of_visit) values(1,10,'2021-01-11');
-- for performance oudit
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM 
(SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_id, 
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
