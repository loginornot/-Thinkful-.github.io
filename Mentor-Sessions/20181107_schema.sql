-- CREATE TABLE `stations` (
-- 	`station_id`	INTEGER,
-- 	`name`	TEXT,
-- 	`lat`	NUMERIC,
-- 	`long`	NUMERIC,
-- 	`dockcount`	INTEGER,
-- 	`city`	TEXT,
-- 	`installation`	TEXT

-- CREATE TABLE `status` (
-- 	`station_id`	INTEGER,
-- 	`bikes_available`	INTEGER,
-- 	`docks_available`	INTEGER,
-- 	`timestamp`	TEXT
--
-- TABLE `trips` (
-- 	`trip_id`	TEXT,
-- 	`duration`	INTEGER,
-- 	`start_date`	TEXT,
-- 	`start_station`	TEXT,
-- 	`start_terminal`	INTEGER,
-- 	`end_date`	TEXT,
-- 	`end_station`	TEXT,
-- `end_terminal`	INTEGER,
-- 	`bike_id`	INTEGER,
-- 	`subscriber_type`	TEXT,
-- 	`zip_code`	INTEGER

-- TABLE `weather` (
-- 	`Date`	TEXT,
-- 	`MaxTemperatureF`	NUMERIC,
-- 	`MeanTemperatureF`	NUMERIC,
-- 	`MinTemperatureF`	NUMERIC,
-- 	`MaxDewPointF`	NUMERIC,
-- 	`MeanDewPointF`	NUMERIC,
-- 	`MinDewpointF`	NUMERIC,
-- 	`MaxHumidity`	NUMERIC,
-- 	`MeanHumidity`	NUMERIC,
-- 	`MinHumidity`	NUMERIC,
-- 	`MaxSeaLevelPressureIn`	NUMERIC,
-- 	`MeanSeaLevelPressureIn`	NUMERIC,
-- 	`MinSeaLevelPressureIn`	NUMERIC,
-- 	`MaxVisibilityMiles`	NUMERIC,
-- 	`MeanVisibilityMiles`	NUMERIC,
-- 	`MinVisibilityMiles`	NUMERIC,
-- 	`MaxWindSpeedMPH`	NUMERIC,
-- 	`MeanWindSpeedMPH`	NUMERIC,
-- 	`MaxGustSpeedMPH`	NUMERIC,
-- 	`PrecipitationIn`	NUMERIC,
-- 	`CloudCover`	INTEGER,
-- 	`Events`	TEXT,
-- 	`WindDirDegrees`	NUMERIC,
-- 	`ZIP`	INTEGER

SELECT
    t.duration,
    w.PrecipitationIn
FROM
    trips t
JOIN
    weather w
ON
    -- t.start_date = w.Date :: This won't work because start_date is a timestamp and Date is a date
    t.zip_code = w.ZIP
WHERE
    w.Events = 'Rain'
ORDER BY
  t.duration DESC
LIMIT
  3
;


SELECT
count(1) as numRows,
station_id
FROM
status
WHERE
docks_available = 0
GROUP BY
station_id
ORDER BY
1 DESC

SELECT
    t.start_station,
    s.dockcount
FROM
    trips t
JOIN
    stations s
on

WITH TempTable
AS(
SELECT
    count(1) as numTrips,
    t.start_station
FROM
    trips t
GROUP BY
    start_station
)
SELECT
    tt.numTrips,
    tt.start_station,
    s.dockcount
FROM
    TempTable tt
JOIN
    stations s
on
    s.name = tt.start_station
ORDER BY
    s.dockcount DESC
