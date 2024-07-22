-- CS4400: Introduction to Database Systems, Summer 2024
-- Project Phase 3: Mock Data Insertion
-- Spencer Banko, Aadarsh Battula, Steven Li, Ronald Zhang



insert into airline values
('Delta', 200),
('RyanAir', 1),
('Emirates', 33),
('Vueling', 994),
('American Airlines', 403),
('Spirit Airlines', 234);

insert into location values
('locationid1'),
('locationid2'),
('locationid3'),
('locationid4'),
('locationid5'),
('locationid6');

insert into airplane values
('Delta', '2390847', 40, 400, 'locationid1', 'jet', 0, 0, 4),
('RyanAir', '210394', 30, 300, 'locationid2', 'prop', 1, 4, 0),
('Emirates', '283838', 30, 200, 'locationid3', 'jet', 0, 0, 2),
('Vueling', '338383', 20, 490, 'locationid4', 'prop', 1, 2, 0),
('American Airlines', '3093847', 50, 500, 'locationid5', 'jet', 0, 0, 5),
('Spirit Airlines', '310394', 45, 450, 'locationid6', 'jet', 0, 1, 1);

insert into airport values
('ATL', 'Hartsfield-Jackson', 'Atlanta', 'Georgia', 'USA', 'locationid1'),
('NYC', 'John F. Kennedy', 'Queens', 'New York', 'USA', 'locationid2'),
('DXB', 'Dubai International', 'Dubai', 'SomeProvince', 'UAE', 'locationid3'),
('BCN', 'Llobregat El Prat', 'Barcelona', 'Catalonia', 'ESP', 'locationid4'),
('LAX', 'Los Angeles International', 'Los Angeles', 'California', 'USA', 'locationid5'),
('FRA', 'Frankfurt Airport', 'Frankfurt', 'Hesse', 'GER', 'locationid6');

insert into leg values
('Leg1ID', 402, 'ATL', 'NYC'),
('Leg2ID', 300, 'DXB', 'BCN'),
('Leg3ID', 500, 'LAX', 'FRA');

insert into route values
('Route1ID'),
('Route2ID'),
('Route3ID');

insert into route_path values
('Route1ID', 'Leg1ID', 3),
('Route2ID', 'Leg2ID', 4),
('Route3ID', 'Leg3ID', 1);

insert into flight values
('Flight1ID', 'Route1ID', 'Delta', '2390847', 3, 'on_ground', '2024-07-21 12:30:34', 2000),
('Flight2ID', 'Route2ID', 'Emirates', '283838', 2, 'in_flight', '2024-07-21 11:30:00', 30300),
('Flight3ID', 'Route3ID', 'American Airlines', '3093847', 1, 'on_ground', '2024-07-22 14:00:00', 2500);

