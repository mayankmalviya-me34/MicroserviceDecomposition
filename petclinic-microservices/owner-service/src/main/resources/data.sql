INSERT INTO pet_types (id, name) VALUES (1, 'cat');
INSERT INTO pet_types (id, name) VALUES (2, 'dog');
INSERT INTO pet_types (id, name) VALUES (3, 'lizard');
INSERT INTO pet_types (id, name) VALUES (4, 'snake');
INSERT INTO pet_types (id, name) VALUES (5, 'bird');
INSERT INTO pet_types (id, name) VALUES (6, 'hamster');

INSERT INTO owners (id, first_name, last_name, address, city, telephone)
VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023');
INSERT INTO owners (id, first_name, last_name, address, city, telephone)
VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749');
INSERT INTO owners (id, first_name, last_name, address, city, telephone)
VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763');

INSERT INTO pets (id, name, birth_date, type_id, owner_id)
VALUES (1, 'Leo', '2010-09-07', 1, 1);
INSERT INTO pets (id, name, birth_date, type_id, owner_id)
VALUES (2, 'Basil', '2012-08-06', 6, 2);
INSERT INTO pets (id, name, birth_date, type_id, owner_id)
VALUES (3, 'Rosy', '2011-04-17', 2, 3);

INSERT INTO visits (id, pet_id, visit_date, description)
VALUES (1, 1, '2023-01-01', 'rabies shot');
INSERT INTO visits (id, pet_id, visit_date, description)
VALUES (2, 3, '2023-02-03', 'neutered');

ALTER TABLE owners ALTER COLUMN id RESTART WITH 100;
ALTER TABLE pets ALTER COLUMN id RESTART WITH 100;
ALTER TABLE visits ALTER COLUMN id RESTART WITH 100;
ALTER TABLE pet_types ALTER COLUMN id RESTART WITH 100;