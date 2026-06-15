select latitude, longitude, brightness, confidence, frp, daynight, acq_date, ingestion_time
from {{ source('wildfire_data', 'fire_streaming') }}
where latitude is not null and longitude is not null
