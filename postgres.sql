
-- table 1
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);

-- All tables insert opearations 

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

SELECT * FROM rangers;

-- table 2
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Red Kangaroo', 'Macropus rufus', '1822-01-01', 'Least Concern'),
('Axolotl', 'Ambystoma mexicanum', '1863-01-01', 'Critically Endangered'),
('Saola', 'Pseudoryx nghetinhensis', '1992-05-21', 'Critically Endangered'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
('Atlantic Puffin', 'Fratercula arctica', '1758-01-01', 'Vulnerable');


SELECT * FROM species;

-- Third sightings Tables 

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Desert Edge Trail', '2024-06-14 09:20:00', 'Kangaroo observed hopping alone'),
(2, 2, 'Lake Xochimilco', '2024-06-15 11:10:00', 'Axolotl seen underwater'),
(3, 3, 'Annamite Mountains', '2024-06-16 07:55:00', 'Saola briefly visible in dense foliage'),
(4, 4, 'Cobra Canyon Path', '2024-06-17 14:05:00', 'Cobra basking near rocks'),
(5, 5, 'Cliffside Nesting Area', '2024-06-18 05:40:00', 'Puffin flying with fish in beak');




SELECT * FROM sightings;

-----------------  Poblems Solutions  -------------------------------------


-- Poblems No: 1

-- Insert a new data on the tables 

INSERT INTO rangers(name , region) VALUES(
    'Derek Fox' , 'Coastal plains'
);

-- Poblems No: 2

SELECT COUNT(DISTINCT species_id) AS  unique_species_count 
from sightings;

-- Poblems No:3

SELECT * FROM sightings
 WHERE location ILIKE '%Pass%';


 -- poblems No: 4

SELECT r.name as "name" , COUNT(s.sighting_id) as "total_sightings"  from rangers as r

LEFT JOIN sightings s ON r.ranger_id = s.ranger_id

GROUP BY r.name;


-- Poblem No:5


SELECT common_name FROM species
 WHERE species_id NOT in(
    SELECT DISTINCT species_id FROM sightings 
);


-- Poblems No:6


SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp USING (species_id)
JOIN rangers r USING (ranger_id)
ORDER BY s.sighting_time DESC
LIMIT 2;


-- Poblem No:7

SELECT * FROM species;

UPDATE species 
SET conservation_status = 'Historic'
WHERE discovery_date < '1825-01-01';

SELECT * FROM sightings;

-- problems No: 8
SELECT sighting_id ,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12  THEN  'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon' 
    ELSE  'Evening'
END AS time_of_day 

FROM sightings;


-- Poblem No:9



DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);