-- CS4400: Introduction to Database Systems, Summer 2024
-- Project Phase 3: View Creation
-- Spencer Banko, Aadarsh Battula, Steven Li, Ronald Zhang

drop view if exists flights_in_the_air;

create view flights_in_the_air as 
with numBtwn as (
	select leg.legID, count(*) as num
	from flight
	join route_path on flight.routeID = route_path.routeID
	join leg on route_path.legID  = leg.legID
	where flight_status = 'in_flight'
    group by leg.legID
	)
select flightID, departure, arrival, next_time, concat(support_airline, support_tail), num
from flight
join route_path on flight.routeID = route_path.routeID
join leg on route_path.legID = leg.legID
join numBtwn on numBtwn.legID = leg.legID
where flight_status = 'in_flight'
;


drop view if exists flights_on_the_ground;

create view flights_on_the_ground as 
with numGrounded as (
	select leg.departure, count(*) as num
	from flight
	join route_path on flight.routeID = route_path.routeID
	join leg on route_path.legID  = leg.legID
	where flight_status = 'on_ground'
    group by leg.departure
	)
select flightID, leg.departure, concat(support_airline, support_tail), num
from flight
join route_path on flight.routeID = route_path.routeID
join leg on route_path.legID = leg.legID
join numGrounded on numGrounded.departure = leg.departure
where flight_status = 'on_ground'
;


drop view if exists alternative_airports;
create view alternative_airports as 
with numAirports as (
	select city, count(*) as num
	from airport 
    group by city
	)
select airport.city, state, num, airport.airportID, airport_name
from airport
join numAirports on airport.city = numAirports.city
;