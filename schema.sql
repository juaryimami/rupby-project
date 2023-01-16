/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
CREATE TABLE animals (
    id integer PRIMARY KEY,
    name varchar (25) not null, 
    date_of_birth date,
    escape_attempts integer, 
    neutered boolean, 
    weight_kg decimal
    );
