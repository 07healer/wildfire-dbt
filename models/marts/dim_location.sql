select distinct
    {{ dbt_utils.generate_surrogate_key(['latitude', 'longitude']) }} as location_id,
    latitude,
    longitude,
    state
from {{ ref('stg_historical_fires') }}
union distinct
select distinct
    {{ dbt_utils.generate_surrogate_key(['latitude', 'longitude']) }} as location_id,
    latitude,
    longitude,
    cast(null as string) as state
from {{ ref('stg_fire_streaming') }}
