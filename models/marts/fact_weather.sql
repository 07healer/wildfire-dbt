select
    w.latitude,
    w.longitude,
    w.temperature,
    w.humidity,
    w.wind_speed,
    w.pressure,
    w.ingestion_time,
    l.location_id
from {{ ref('stg_weather_streaming') }} w
left join {{ ref('dim_location') }} l
    on w.latitude = l.latitude and w.longitude = l.longitude