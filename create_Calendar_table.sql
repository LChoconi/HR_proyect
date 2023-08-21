CREATE TABLE calendar AS
with recursive cte as (
	-- customize start date here
	select date('2023-09-01') as calendar_date
	union all
	select date_add(calendar_date, interval 1 day) as calendar_date from cte 
	-- customize end date here
	where (date_add(calendar_date, interval 1 day)) <= date('2024-12-31')
)
select
calendar_date,
year(calendar_date) as year,
monthname(calendar_date) as month,
day(calendar_date) as day
from cte;


