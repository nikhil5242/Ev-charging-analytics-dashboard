CREATE TABLE ev_data (
    timestamp TIMESTAMP,
    station_id TEXT,
    station_name TEXT,
    network TEXT,
    city TEXT,
    state TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    location_type TEXT,
    charger_type TEXT,
    power_output_kw DOUBLE PRECISION,
    amenities_nearby TEXT,

    ports_total INTEGER,
    ports_available INTEGER,
    ports_occupied INTEGER,
    ports_out_of_service INTEGER,
    utilization_rate DOUBLE PRECISION,
    station_status TEXT,
    estimated_wait_time_mins DOUBLE PRECISION,
    avg_session_duration_mins DOUBLE PRECISION,

    current_price DOUBLE PRECISION,
    pricing_type TEXT,

    temperature_f DOUBLE PRECISION,
    precipitation_mm DOUBLE PRECISION,
    weather_condition TEXT,

    gas_price_per_gallon DOUBLE PRECISION,
    traffic_congestion_index DOUBLE PRECISION,
    local_event TEXT,

    is_weekend BOOLEAN,
    is_peak_hour BOOLEAN,

    hour_of_day INTEGER,
    day_of_week INTEGER,
    month INTEGER
);

select * from ev_data




SELECT
    COUNT(*) - COUNT(timestamp) AS missing_timestamps,
    COUNT(*) - COUNT(station_id) AS missing_station_ids,
    COUNT(*) - COUNT(utilization_rate) AS missing_utilization,
    COUNT(*) - COUNT(current_price) AS missing_prices,
    COUNT(*) - COUNT(weather_condition) AS missing_weather,
    COUNT(*) - COUNT(ports_total) AS missing_ports_total
FROM ev_data;



SELECT timestamp, station_id, COUNT(*)
FROM ev_data
GROUP BY timestamp, station_id
HAVING COUNT(*) > 1;



SELECT DISTINCT network FROM ev_data;

SELECT DISTINCT city FROM ev_data;


SELECT *
FROM ev_data
WHERE ports_total != (ports_available + ports_occupied + ports_out_of_service);


SELECT *
FROM ev_data
WHERE utilization_rate < 0 OR utilization_rate > 1;


SELECT *
FROM ev_data
WHERE avg_session_duration_mins <= 0;


SELECT *
FROM ev_data
WHERE current_price < 0;



SELECT *
FROM ev_data
WHERE hour_of_day < 0 OR hour_of_day > 23;


SELECT *
FROM ev_data
WHERE day_of_week < 0 OR day_of_week > 6;

SELECT *
FROM ev_data
WHERE month < 1 OR month > 12;



SELECT *
FROM ev_data
WHERE is_weekend = TRUE AND day_of_week NOT IN (0,6);





ALTER TABLE ev_data ADD COLUMN utilization_level TEXT;

UPDATE ev_data
SET utilization_level =
CASE
    WHEN utilization_rate < 0.3 THEN 'low'
    WHEN utilization_rate < 0.7 THEN 'medium'
    ELSE 'high'
END;


ALTER TABLE ev_data ADD COLUMN time_slot TEXT;

UPDATE ev_data
SET time_slot =
CASE
    WHEN hour_of_day BETWEEN 6 AND 11 THEN 'morning'
    WHEN hour_of_day BETWEEN 12 AND 17 THEN 'afternoon'
    WHEN hour_of_day BETWEEN 18 AND 22 THEN 'evening'
    ELSE 'night'
END;



ALTER TABLE ev_data ADD COLUMN high_demand BOOLEAN;

UPDATE ev_data
SET high_demand =
CASE
    WHEN utilization_rate > 0.8 OR estimated_wait_time_mins > 20 THEN TRUE
    ELSE FALSE
END;



ALTER TABLE ev_data ADD COLUMN estimated_hourly_revenue DOUBLE PRECISION;

UPDATE ev_data
SET estimated_hourly_revenue = (ports_occupied * current_price);


ALTER TABLE ev_data ADD COLUMN station_health_score DOUBLE PRECISION;

UPDATE ev_data
SET station_health_score =
    CASE
        WHEN ports_total = 0 THEN 0
        ELSE (ports_total - ports_out_of_service) * 1.0 / ports_total
    END;



ALTER TABLE ev_data ADD COLUMN is_unacceptable_wait BOOLEAN;

UPDATE ev_data
SET is_unacceptable_wait =
    CASE
        WHEN estimated_wait_time_mins > 15 AND is_peak_hour = TRUE THEN TRUE
        ELSE FALSE
    END;


ALTER TABLE ev_data ADD COLUMN hourly_output_capacity DOUBLE PRECISION;

UPDATE ev_data
SET hourly_output_capacity =
    CASE
        WHEN avg_session_duration_mins <= 0 THEN 0
        ELSE (60.0 / avg_session_duration_mins) * ports_total
    END;
