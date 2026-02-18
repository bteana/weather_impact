-- 1. Número de viajes por compañía (15 y 16 de noviembre)
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) > '2017-11-14' 
    AND CAST(trips.start_ts AS date) < '2017-11-17'
GROUP BY 
    company_name
ORDER BY 
    trips_amount DESC;

-- 2. Viajes de compañías Yellow y Blue (1 al 7 noviembre)
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
    AND company_name LIKE '%Yellow%'  
GROUP BY 
    company_name 
UNION ALL
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07'
    AND company_name LIKE '%Blue%'  
GROUP BY 
    company_name 

-- 3. Clasificación de compañías principales
SELECT
    CASE 
        WHEN company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END AS company,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE 
    CAST(trips.start_ts AS date) BETWEEN '2017-11-01' AND '2017-11-07' 
GROUP BY 
    company
ORDER BY 
    trips_amount DESC;

-- 4. Identificación de los barrios Loop y O'Hare
SELECT 
    *
FROM 
    neighborhoods
WHERE 
    WHERE name IN ('O''Hare', 'Loop')

-- 5. Clasificación climática
SELECT 
    ts, 
    CASE 
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad' 
        ELSE 'Good' 
    END AS weather_conditions
FROM 
    weather_records

-- 6. Viajes Loop → O'Hare los sábados  
SELECT
    trips.start_ts AS start_ts,
    CASE 
        WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad' 
        ELSE 'Good' 
    END AS weather_conditions,
    trips.duration_seconds
FROM 
    trips
INNER JOIN weather_records ON weather_records.ts = trips.start_ts
WHERE 
    EXTRACT(DOW from trips.start_ts) = 6 
    AND trips.pickup_location_id = 50 
    AND trips.dropoff_location_id = 63
ORDER BY start_ts;
