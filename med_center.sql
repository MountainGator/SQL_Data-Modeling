DROP DATABASE IF EXISTS medical;
CREATE DATABASE medical;

CREATE TABLE doctors (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT);
CREATE TABLE patients (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT);
CREATE TABLE diagnosis_list (id SERIAL PRIMARY KEY, diagnosis TEXT);

CREATE TABLE relationships 
    (
        id SERIAL PRIMARY KEY, 
        doctors_id INTEGER REFERENCES doctors (id) ON DELETE CASCADE,
        patients_id INTEGER REFERENCES patients (id) ON DELETE CASCADE
    );

CREATE TABLE diagnoses 
    (
        id SERIAL PRIMARY KEY, 
        patients_id INTEGER REFERENCES patients(id)  ON DELETE CASCADE,
        diagnosis_list_id INTEGER REFERENCES diagnosis_list (id) ON DELETE CASCADE
    );