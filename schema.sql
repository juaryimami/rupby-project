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