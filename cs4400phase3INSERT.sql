-- CS4400: Introduction to Database Systems, Summer 2024
-- Project Phase 3: Mock Data Insertion
-- Spencer Banko, Aadarsh Battula, Steven Li, Ronald Zhang


-- check the ones w/ id (locid, airplaneid, etc.)

insert into airline values
('Delta', 200),
('RyanAir', 1);

insert into location values
('ATL'),
('NY');

insert into airplane values
('Delta', '2390847', 40, 400, 'ATL', 'jet', 0, 0, 4),
('RyanAir', '210394', 30, 300, 'ATL', 'prop', 1, 4, 0);

insert into airport values
('A2C', 'Hartsfield-Jackson', 'Atlanta', 'Georgia', 'USA', 'ATL'),
('B3D', 'JFK', 'Queens', 'New York', 'USA', 'NY');

insert into leg values
('Leg1ID', 402, 'A2C', 'B3D');

insert into route values
('Route1ID');

insert into route_path values
('Route1ID', 'Leg1ID', 3);

insert into flight values
('Flight1ID', 'Route1ID', 'Delta', '2390847', 3, 'on_ground', '2024-07-21 12:30:34', 2000); 