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
------------
SELECT
	Min(tobs) as min_temp
	,Avg(tobs) as ave_temp
	,max(tobs) as max_temp
FROM
	station
Inner Join measurement
	using(station)
where station = 'USC00519281'

--------

SELECT
	Min(tobs) as min_temp
	,round(Avg(tobs),1) as ave_temp
	,max(tobs) as max_temp
FROM
	station
Inner Join measurement
	using(station)
where station = 'USC00519281'
AND date Between 
	(Select Date(Max(date),'-1 year') From measurement)
AND
	(Select Max(date) From measurement)	
	
	-------------
	
	SELECT
		 Min(tobs) as min_temp
		,round(Avg(tobs),1) as ave_temp
		,max(tobs) as max_temp 
	FROM
		measurement
	where date Between 
		'2012-02-28'
	AND
		'2012-03-05'	

	-----------------
	
	SELECT
		 Min(tobs) as min_temp
		,round(Avg(tobs),1) as ave_temp
		,max(tobs) as max_temp 
	FROM
		measurement
		
	Group by date
	having date Between 
		'2012-02-28'
	AND
		'2012-03-05'
--------

SELECT
	station,
	name,
	sum(prcp) as total_precipitation,
	latitude,
	longitude,
	elevation
	
FROM
	station
Inner Join measurement
	using(station)
Where date Between 
		'2012-02-28'
	AND
		'2012-03-05'
Group By
	station
Order by total_precipitation DESC;

----------------

strftime("%m-%Y", transDate)

 SELECT
                 Min(tobs) as min_temp
                ,round(Avg(tobs),1) as ave_temp
                ,max(tobs) as max_temp 
            FROM
                station
            Inner Join measurement
                using(station)
            where strftime("%m-%d", date) = '12-01'  

SELECT * From measurement