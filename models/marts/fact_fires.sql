select
    h.fire_id,
    cast(h.fire_year as string)  as fire_year,
    h.cause,
    h.fire_size_acres,
    h.fire_size_class,
    h.latitude,
    h.longitude,
    h.state,
    h.source,
    l.location_id
from {{ ref('stg_historical_fires') }} h
left join {{ ref('dim_location') }} l
    on h.latitude = l.latitude and h.longitude = l.longitude
union all
select
    cast(null as int64)     as fire_id,
    cast(null as string)    as fire_year,
    cast(null as string)    as cause,
    cast(null as float64)   as fire_size_acres,
    cast(null as string)    as fire_size_class,
    s.latitude,
    s.longitude,
    cast(null as string)    as state,
    s.source,
    l.location_id
from {{ ref('stg_fire_streaming') }} s
left join {{ ref('dim_location') }} l
    on s.latitude = l.latitude and s.longitude = l.longitude
