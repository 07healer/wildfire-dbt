select
    latitude,
    longitude,
    temperature,
    humidity,
    wind_speed,
    pressure,
    ingestion_time
from {{ source('wildfire_data', 'weather_streaming') }}