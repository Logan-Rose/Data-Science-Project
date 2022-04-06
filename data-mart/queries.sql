-- a. Drill down and roll up. – 2 queries by using concept hierarchies in your
-- data mart, such as (name, region, continent) and (month, quarter, year,
-- decade).
-- Rolled up to continent
select
  count(*),
  E.event_type,
  C.continent
FROM
  fact as F,
  country as C,
  event as E
WHERE
  F.country_key = C.key
  and F.event_key = E.key
group by
  E.event_type,
  C.continent,
  rollup (C.continent);
-- get the Number of each type of event in each country per year
select
  count(*),
  D.year,
  E.event_type,
  C.short_name
FROM
  fact as F,
  month as D,
  country as C,
  event as E
WHERE
  F.date_key = D.key
  and F.country_key = C.key
  and F.event_key = E.key
group by
  E.event_type,
  C.short_name,
  rollup (D.year)
Order by
  D.year;
-- b. Slice, where only one dimension is selected. – 1 query
  -- For instance, contrast (i) the prevalence of health conditions, (ii) the literacy
  -- rates, or (iii) the life expectancies in your nine (9) countries.
SELECT
  fact.*,
  education.adult_literacy_rate
from
  fact
  INNER JOIN education ON fact.education_key = education.key
GROUP BY
  fact.key,
  education.key;
-- c. Dice, where one creates a sub‐cube. – 2 queries
  -- For instance, contrast (i) the prevalence of health conditions, (ii) the literacy
  -- rates, or (iii) the life expectancies in Canada versus Mexico.
SELECT
  country.short_name,
  education.*
from
  fact
  INNER JOIN education ON fact.education_key = education.key
  INNER JOIN country ON fact.country_key = country.key
WHERE
  country.alpha_code = 'CAN'
  OR country.alpha_code = 'MEX'
GROUP BY
  country.key,
  education.key;
-- d. Combining OLAP operations. In these queries, we combine the above‐
  -- mentioned operations. – 4 queries. For instance, we may explore the data
  -- characteristics i) during different time periods, ii) when certain events were
  -- taking place, iii) for different countries and regions, iv) while comparing age
  -- groups, or v) contrasting unemployment rates.
  -- Part 2. Explorative operation – 3 queries
  -- Identify general trends using advanced SQL operations. Give one query from
  -- each one of these categories.
  -- a. Iceberg queries. For instance,
  -- i) find the five years with the highest population growths,
SELECT
  sum(population_growth) as total_growth,
  sub.year
from
  (
    select
      round(AVG(population_growth * total_population / 100)) as population_growth,
      month.year,
      country.alpha_code
    from
      fact
      inner join population on Fact.population_key = population.key
      inner join month on fact.date_key = month.key
      inner join country on fact.country_key = country.key
    GROUP BY
      month.year,
      country.key
  ) as sub
group by
  year
order by
  total_growth Desc
Limit
  5;
-- b. Windowing queries. For instance, display the ranking of the countries
  -- in terms of the literacy rates, as reported per gender, over the last five
  -- years.
select
  country.short_name,
  month.year,
  month.name,
  round(avg(education.male_literacy_rate)) as male_literacy_rate,
  round(avg(education.female_literacy_rate)) as female_literacy_rate
from
  fact
  inner join education on fact.education_key = education.key
  inner join month on fact.date_key = month.key
  inner join country on fact.country_key = country.key
Group by
  country.key,
  month.year,
  month.name;
-- c. Using the Window clause. For instance, compare the number of
  -- hospital beds in Canada in 2019 to that of the previous and next years.
Select
  health.hospital_beds_per_thousand
From
  fact
  inner join health on fact.health_key = health.key;
--   Drill Down:
  -- •    Drill down from continent to region or country
  -- •    HDI of country/region with population greater than 10 million?
  -- Roll – up:
  -- •    Roll up from month to year
  -- •    Infant mortality rate in “x” year when a disaster occurred
  -- Slice:
  -- •    The prevalence of under nourishment during x year for all countries
  -- Dice:
  -- •    The HDI of Canada and United States in 2018
  --SQL SLice Example
SELECT
  count(*),
  E.event_type,
  C.short_name,
  M.quarter
FROM
  fact as F,
  country as C,
  event as E,
  month as M
WHERE
  F.country_key = C.key
  and F.event_key = E.key
  and F.date_key = M.key
  and C.alpha_code in ('CAN', 'USA', 'BRA', 'MEX')
  and M.quarter = 2
  and E.event_type in ('Flood', 'Storm', 'Wildfire')
GROUP BY
  (C.short_name, E.key, m.key);
SELECT
  count(*),
  E.adult_literacy_rate,
  E.male_literacy_rate,
  E.female_literacy_rate,
  C.short_name,
  M.quarter
FROM
  fact as F,
  country as C,
  education as E,
  month as M
WHERE
  F.country_key = C.key
  and F.education_key = E.key
  and F.date_key = M.key
  and C.income_group in ('Lower middle income', 'Low income')
GROUP BY
  (C.short_name, E.key, m.key);
--Cube
select
  count(*),
  M.name,
  M.year E.event_type,
from
  fact table as F,
  Month as M,
  Event as E,
WHere
  F.date_key = month.key
  and F.event_key = E.key
Group By
  (M.name, M.year, E.event_type)
Order by
  M.name,
  M.year;
--Subquery to get annual HDI, and health expenditure of each country
Select
  DISTINCT C.short_name,
  M.year,
  H.health_expenditure,
  F.hdi
from
  fact as F,
  country as C,
  health as H,
  Month as M
where
  F.country_key = C.key
  and F.health_key = H.key
  and F.date_key = M.key
ORDER BY
  M.year;
--
Select
  Distinct C.short_name,
  M.month_start,
  E.adult_literacy_rate,
  Avg(E.adult_literacy_rate) over (partition by C.short_name)
from
  Fact as F,
  Month as M,
  Education as E,
  Country C
where
  F.country_key = C.key
  and F.education_key = E.key
  and F.date_key = M.key
Order By
  C.short_name,
  M.month_start;
-- Drill Down: Total damages from all meteorological disasters in USA
Select
  M.name,
  M.year,
  E.event_type,
  E.total_affected,
  C.short_name
from
  fact F,
  event E,
  Month M,
  Country C
where
  F.event_key = E.key
  and F.date_key = M.key
  and F.country_key = C.key
  and e.event_type = 'Storm'
  and C.short_name = 'Mexico'
group by
  (
    E.key,
    M.name,
    M.year,
    C.short_name,
    E.event_type
  );
Select
  distinct on (p.population_key) p."year",
  p.country,
  HDI(f.HDI)
from
  population as p,
  fact as f,
  quality_of_
where
  p.population_key = f.population_key
  and q.qol_key = f.qol_key
  and p."Suicide mortality rate (per 100,000 population)" < 2.1
  and q."Unemployment, total (% of total labor force)" < 8
  and f."Quality of Life" > 0