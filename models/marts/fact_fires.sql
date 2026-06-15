select
    cast(h.fire_id as string)                as fire_id,
    cast(h.fire_year as string)              as fire_year,
    h.discovery_date,
    h.cause,
    h.fire_size_acres,
    h.fire_size_class,
    cast(null as float64)                    as brightness,
    cast(null as string)                     as confidence,
    cast(null as float64)                    as frp,
    h.latitude,
    h.longitude,
    h.state,
    'historical'                             as source,
    to_hex(md5(concat(cast(h.latitude as string),'|',cast(h.longitude as string)))) as location_id,
    to_hex(md5(cast(h.discovery_date as string))) as date_id
from {{ ref('stg_historical_fires') }} h
where h.latitude is not null and h.longitude is not null
union all
select
    cast(null as string)                     as fire_id,
    cast(null as string)                     as fire_year,
    cast(null as date)                       as discovery_date,
    cast(null as string)                     as cause,
    cast(null as float64)                    as fire_size_acres,
    cast(null as string)                     as fire_size_class,
    s.brightness,
    cast(s.confidence as string)             as confidence,
    s.frp,
    s.latitude,
    s.longitude,
    cast(null as string)                     as state,
    'streaming'                              as source,
    to_hex(md5(concat(cast(s.latitude as string),'|',cast(s.longitude as string)))) as location_id,
    cast(null as string)                     as date_id
from {{ ref('stg_fire_streaming') }} s
where s.latitude is not null and s.longitude is not null
