SELECT
	*
FROM
	measurement;
	
------
SELECT
	*
FROM
	station;
--------

SELECT
	date
	,AVG(prcp) As precipitation
FROM
	station
Inner Join measurement
	using(station)
Group By
	date
Having date Between 
	(Select Max(date)-'interval 1 year' From measurement)
AND
	(Select Max(date)From measurement)
Order by date
------------	
SELECT
*
FROM
 measurement
where date = MAX(date)
------------	
SELECT
	DISTINCT station,
	station.id
FROM
	station
Inner Join measurement
	using(station)

SELECT
	date
	,AVG(prcp) As precipitation
FROM
	station
Inner Join measurement
	using(station)
Group By
	date
Having date Between 
	(Select Date(Max(date),'-1 year') From measurement)
AND
	(Select Max(date) From measurement)
Order by date
-------------------

SELECT
	Distinct station
FROM
	station
Inner Join measurement
	using(station)
--------
SELECT
	station,
	name,
	count(station) as count
	
FROM
	station
Inner Join measurement
	using(station)
Group By
	station
Order by count DESC

	