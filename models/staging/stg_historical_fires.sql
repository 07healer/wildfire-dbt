select
    FOD_ID                  as fire_id,
    FIRE_NAME               as fire_name,
    FIRE_YEAR               as fire_year,
    DISCOVERY_DATE          as discovery_date_julian,
    DISCOVERY_DOY           as discovery_day_of_year,
    STAT_CAUSE_DESCR        as cause,
    FIRE_SIZE               as fire_size_acres,
    FIRE_SIZE_CLASS         as fire_size_class,
    LATITUDE                as latitude,
    LONGITUDE               as longitude,
    STATE                   as state,
    COUNTY                  as county,
    OWNER_DESCR             as owner,
    'historical'            as source
from {{ source('wildfire_data', 'historical_fires') }}