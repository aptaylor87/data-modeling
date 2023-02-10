
DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE,
    insurance_carrier TEXT
);


CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    date_of_visit DATE

);



CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE SET NULL,
    disease TEXT NOT NULL
);

Insert into doctors (first_name, last_name, specialty)
VALUES
('Ron', 'Ford', 'Cardiology'),
('Shelly', 'Rogers', 'Gastroenterology'),
('Chris', 'Parks', 'Podiatry');

Insert into patients (first_name, last_name, date_of_birth, insurance_carrier)
VALUES
('John', 'Doe', '1987-12-21', 'Cigna'),
('Jane', 'Doe', '1985-06-04', 'Cigna'),
('Bob', 'Smith', '1974-04-02', 'Premera');

Insert into visits (doctor_id, patient_id, date_of_visit)
VALUES
(2, 3, '2023-01-04'),
(1, 2, '2023-01-31'),
(3, 1, '2023-02-04');

Insert into diagnoses (visit_id, disease)
VALUES
(1, 'broken heart'),
(1, 'just plain unlucky'),
(2, 'tummy ache');