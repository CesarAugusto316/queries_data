select count(*) from flights;
select count(*) from airports_data;

-- The 3 Departure airports with the most flights
select count(airports_data.airport_code), airports_data.airport_code, airports_data.airport_name  from flights 
  inner join airports_data
  on flights.departure_airport = airports_data.airport_code
  group by airports_data.airport_code order by count(airports_data.airport_code) desc
  limit 3;

-- The 3 Arrival airports with the most flights
select count(airports_data.airport_code), airports_data.airport_code, airports_data.airport_name from flights
  inner join airports_data
  on flights.arrival_airport = airports_data.airport_code 
  group by airports_data.airport_code order by count(airports_data.airport_code) desc
  limit 3;

-- The airport with the most flights
-- Every flight has an arrival airport and a departure airport, so we must add both to get
-- the total of flights per airport.
select count(airports_data.airport_code), airports_data.airport_code from airports_data
inner join flights on flights.arrival_airport = airports_data.airport_code or flights.departure_airport = airports_data.airport_code 
group by airports_data.airport_code
order by count(airports_data.airport_code) desc
limit 3;

-- The airport with the least flights
select count(airports_data.airport_code), airports_data.airport_code from airports_data
inner join flights on flights.arrival_airport = airports_data.airport_code or flights.departure_airport = airports_data.airport_code 
group by airports_data.airport_code
order by count(airports_data.airport_code) asc
limit 3;

-- mostrar el valor promedio de los tickets por avión
-- show the average ticket amount by aircraft

-- every tikect_flight has three catgeories: Economy, Business, Comfort	
-- every flight_ticket has amount and flight_id, and every flight_id has an aircraft_code

select avg(ticket_flights.amount) as average, aircrafts_data.model from ticket_flights
  inner join flights on flights.flight_id = ticket_flights.flight_id 
  inner join aircrafts_data on flights.aircraft_code = aircrafts_data.aircraft_code
  group by aircrafts_data.model
  order by average desc;
