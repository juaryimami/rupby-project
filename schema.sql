/* Database schema to keep the structure of entire database. */

-- SCHEMA FOR ANIMALS TABLE
CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id integer PRIMARY KEY,
    name varchar (25) not null, 
    date_of_birth date,
    escape_attempts integer, 
    neutered boolean, 
    weight_kg decimal,
    species varchar(50) default 'Animals'
    );

    -- SCHEMA FOR OWNERS TABLE
CREATE TABLE owners(id SERIAL PRIMARY KEY,
    full_name VARCHAR(255), age INTEGER);

    -- SCHEMA FOR SPECIES TABLE
CREATE TABLE species(id SERIAL PRIMARY KEY, name VARCHAR(255));

-- task two modifying animal table
ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD column species_id serial;
ALTER TABLE animals ADD CONSTRAINT fk_spe 
FOREIGN KEY (species_id)REFERENCES species(id);
ALTER TABLE animals ADD column owner_id serial;
ALTER TABLE animals ADD CONSTRAINT fk_own FOREIGN KEY (owner_id)REFERENCES owners(id);

-- SCHEMA FOR VETS TABLE
CREATE TABLE vets(id SERIAL PRIMARY KEY, name VARCHAR(50), age INTEGER, date_of_graduation date);

-- SCHEMA FOR SPECIALIZATION TABLE
CREATE TABLE specializations(id SERIAL PRIMARY KEY, 
vets_id INTEGER REFERENCES vets(id), 
species_id INTEGER REFERENCES species(id));

-- SCHEMA FOR VISITS TABLE
CREATE TABLE visits(id serial primary key, 
vets_id integer REFERENCES vets(id), 
animal_id integer REFERENCES animals(id),
date_of_visit date);

-- performance audit
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX owners_email_idx ON owners(email);
CREATE INDEX visits_animal_id_idx ON visits(animal_id);
CREATE INDEX visits_vets_id_idx ON visits(vets_id);