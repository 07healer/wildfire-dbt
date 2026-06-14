select
    FOD_ID                  as fire_id,
    FIRE_YEAR               as fire_year,
    DISCOVERY_DATE_CONVERTED as discovery_date,
    STAT_CAUSE_DESCR        as cause,
    FIRE_SIZE               as fire_size_acres,
    FIRE_SIZE_CLASS         as fire_size_class,
    LATITUDE                as latitude,
    LONGITUDE               as longitude,
    STATE                   as state,
    'historical'            as source
from {{ source('wildfire_data', 'historical_fires') }}
