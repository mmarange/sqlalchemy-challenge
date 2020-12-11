# SQLAlchemy Homework - Surfs Up!

![surfs-up.png](Images/surfs-up.png)

### Precipitation Analysis

![precipitation](Images/LinePlot.png)

  The highest rainfall was recieved between August 2016 and October 2016

The table shows precipitation statistics

![stats](Images/prep_stats.png)

### Station Analysis

Whaihee station has the most obeservations as shown in the table below.

![station_counts](Images/stations_count.png)

The Histogram below shows that the most days have a temperature around 75°F

![station-histogram](Images/Histogram.png)

- - -

## Step 2 - Climate App

* The following routes where created using Flask 

### Routes

* `/`
  * Home page.

![home_page](Images/home_page.png)


* `/api/v1.0/precipitation`

![prep_app](Images/precip_app.png)


* `/api/v1.0/stations`

![station_app_](Images/stations_app.png)

* `/api/v1.0/tobs`

![temp](Images/tobs_app.png)

* `/api/v1.0/<start>` and `/api/v1.0/<start>/<end>`

![start_date_app](Images/start_date_app.png)

![date_range](Images/date_range_app.png)





- - -

## Part 3: Data Analyses


### Temperature Analysis I

* Average temperature in June at all stations across all available years in the dataset. 

 ![june_temp](Images/June_Ave_Temp.png)

* Average temperature in December at all stations across all available years in the dataset.

 ![dec_temp](Images/Dec_Ave_Temp.png)

* The p-value of the test is 3.902513e-191, which is less than the significance level alpha (e.g., 0.05). This means that we can conclude that the Average Temperature in Hawai in June is statistically different from the Average Temperature in Hawai in December

 ![ttest](Images/ttest.png)


### Temperature Analysis II

  ![errorbar](Images/errorbar.PNG)

### Daily Rainfall Average


Daily normal rainfall for same days as holiday days

  ![daily-normals](Images/AreaPlot.png)

### Copyright


