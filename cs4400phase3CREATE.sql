-- CS4400: Introduction to Database Systems, Summer 2024
-- Project Phase 3: Database Creation
-- Spencer Banko, Aadarsh Battula, Steven Li, Ronald Zhang

set global transaction isolation level serializable;
set global SQL_MODE = 'ANSI,TRADITIONAL';
set names utf8mb4;
set SQL_SAFE_UPDATES = 0;
set @thisDatabase = 'sams';


drop database if exists sams;
create database if not exists sams;
use sams;

create table airline (
  airlineID varchar(50),
  revenue decimal(12, 0),
  primary key (airlineID)
) engine = innodb;

create table location (
  locID varchar(50),
  primary key (locID)
) engine = innodb;

create table airplane (
  airlineID varchar(50),
  tail_num varchar(50),
  seat_cap int,
  speed int,
  locID varchar(50),
  plane_type varchar(100),
  skids boolean,
  props int,
  num_engines int,
  primary key (airlineID, tail_num),
  foreign key (airlineID) references airline(airlineID),
  foreign key (locID) references location(locID)
) engine = innodb;

create table airport (
  airportID char(3),
  airport_name varchar(200),
  city varchar(100),
  state varchar(100),
  country char(3),
  locID varchar(50),
  primary key (airportID),
  foreign key (locID) references location(locID)
) engine = innodb;

create table leg (
  legID varchar(50),
  distance int,
  departure char(3) not null,
  arrival char(3) not null,
  primary key (legID),
  foreign key (departure) references airport(airportID),
  foreign key (arrival) references airport(airportID)
) engine = innodb;

create table route (
  routeID varchar(50),
  primary key (routeID)
) engine = innodb;

create table route_path (
  routeID varchar(50),
  legID varchar(50),
  sequence int,
  primary key (routeID, legID, sequence),
  foreign key (routeID) references route(routeID),
  foreign key (legID) references leg(legID)
) engine = innodb;

create table flight (
  flightID varchar(50),
  routeID varchar(50) not null,
  support_airline varchar(50),
  support_tail varchar(50),
  progress int,
  flight_status enum('on_ground', 'in_flight'), -- idk if this is what they want
  next_time datetime,
  cost int,
  primary key (flightID),
  foreign key (routeID) references route(routeID),
  foreign key (support_airline, support_tail) references airplane(airlineID, tail_num)
) engine = innodb;