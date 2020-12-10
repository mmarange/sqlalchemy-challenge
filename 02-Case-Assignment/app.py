# %%
# Import Dependencies
import sqlalchemy
from sqlalchemy import create_engine
import pandas as pd

import json
import flask
from flask import Flask, jsonify

import datetime as dt

# Ignore SQLITE warnings related to Decimal numbers in the Hawaii database
import warnings
warnings.filterwarnings('ignore')
#%%
# Create an engine for the chinook.sqlite database
engine = create_engine('sqlite:///Resources/hawaii.sqlite')
conn = engine.connect()

# %%

# %%
app =Flask(__name__)
@app.route('/')
def HomePage():
            
    print("Home page running")   
    
    return(
            f" Welcome to the weather API, navigate to the routes below:<br/>"
           f"/api/v1.0/precipitation<br/>"
           f"/api/v1.0/stations<br/>"
           f"/api/v1.0/tobs<br/>"
           f" /api/v1.0/<start><br/>"
           f" /api/v1.0/<start>/<end><br/>"
           )

#%%
@app.route('/api/v1.0/precipitation')
def precipitation():
    conn = engine.connect()
    query = '''
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
    '''
    results = pd.read_sql(query, conn)
 
    results_json = results.to_json(orient='records') 
    print("precipitation app running")
    return results_json

#%%
@app.route('/api/v1.0/stations')
def stations():
    conn = engine.connect()
    query = '''
    SELECT
    	DISTINCT station,
        name
    FROM
    	station
    Inner Join measurement
    	using(station)'''

    results = pd.read_sql(query, conn)
    results_json = results.to_json(orient='records') 
    print("stations app running")
    return results_json 

@app.route('/api/v1.0/tobs')
def temperature():
    #Finding the most active station
    conn = engine.connect()
    
    query_active = '''
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
    '''
    active_station = pd.read_sql(query_active, conn)
    
    most_active_id = active_station['station'].values[0]
#Finding the temperature records from the last 12 months at the most active station
    query = f'''
    SELECT
    	date
    	,tobs
    FROM
    	station
    Inner Join measurement
    	using(station)
    where station = '{most_active_id}'
    AND date Between 
    	(Select Date(Max(date),'-1 year') From measurement)
    AND
    	(Select Max(date) From measurement)	
    '''

    stats_active_station_last1year =  pd.read_sql(query, conn)
    stats_active_station_last1year_json = stats_active_station_last1year.to_json(orient='records')
    
    return stats_active_station_last1year_json


if __name__ == '__main__':
    app.run(debug=True)