select latitude, longitude, bright_ti4 as brightness, confidence, frp, daynight, acq_date, ingestion_time, temperature, humidity, wind_speed, pressure
from {{ source('wildfire_data', 'fire_weather') }}
where latitude is not null and longitude is not null and frp is not null
