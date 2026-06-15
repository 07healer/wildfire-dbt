with dates as (
    select distinct discovery_date
    from {{ ref('stg_historical_fires') }}
    where discovery_date is not null
)
select
    to_hex(md5(cast(discovery_date as string))) as date_id,
    discovery_date,
    extract(year    from discovery_date) as year,
    extract(quarter from discovery_date) as quarter,
    extract(month   from discovery_date) as month,
    extract(day     from discovery_date) as day,
    extract(dayofweek from discovery_date) as day_of_week,
    format_date('%A', discovery_date) as weekday_name,
    format_date('%B', discovery_date) as month_name
from dates
