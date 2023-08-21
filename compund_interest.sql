WITH RECURSIVE cte AS (
  SELECT id, year, month, date, increase_percentaje, 1*(1+ increase_percentaje/100) AS increase_index, id-1 AS count_with
  FROM salaryincrease
  UNION ALL
  SELECT t.id, t.year, t.month, t.date, t.increase_percentaje, increase_index * (1+t.increase_percentaje/100), count_with
  FROM salaryincrease t
  JOIN cte c
    ON c.id = t.id-1
)
SELECT DISTINCT
	id, year, month, date, increase_index
FROM cte
WHERE count_with=0
ORDER BY id, date;