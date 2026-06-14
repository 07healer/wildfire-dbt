select distinct
    fire_year,
    discovery_day_of_year,
    discovery_date_julian
from {{ ref('stg_historical_fires') }}
where fire_year is not null