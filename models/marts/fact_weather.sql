select
    w.latitude,
    w.longitude,
    w.temperature,
    w.humidity,
    w.wind_speed,
    w.pressure,
    w.ingestion_time,
    to_hex(md5(concat(cast(w.latitude as string),'|',cast(w.longitude as string)))) as location_id
from {{ ref('stg_fire_weather') }} w
where w.latitude is not null and w.longitude is not null
