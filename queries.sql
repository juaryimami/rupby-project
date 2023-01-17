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