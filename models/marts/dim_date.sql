select distinct
    fire_year,
    discovery_date
from {{ ref('stg_historical_fires') }}
where fire_year is not null
