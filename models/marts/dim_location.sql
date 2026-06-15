with locations as (
    select latitude, longitude, state
    from {{ ref('stg_historical_fires') }}
    where latitude is not null and longitude is not null
    union distinct
    select latitude, longitude, cast(null as string) as state
    from {{ ref('stg_fire_weather') }}
    where latitude is not null and longitude is not null
    union distinct
    select latitude, longitude, cast(null as string) as state
    from {{ ref('stg_fire_streaming') }}
    where latitude is not null and longitude is not null
)
select
    to_hex(md5(concat(cast(latitude as string),'|',cast(longitude as string)))) as location_id,
    latitude,
    longitude,
    max(state) as state
from locations
group by latitude, longitude
