-- a. Drill down and roll up. – 2 queries by using concept hierarchies in your
-- data mart, such as (name, region, continent) and (month, quarter, year,
-- decade).
-- Rolled up to continent
SELECT
  ROUND(AVG(fact.avg_births)) as births,
  ROUND(AVG(fact.avg_births)) as deaths,
  ROUND(AVG(fact.hdi), 2) as hdi,
  country.continent
from
  fact
  INNER JOIN country ON fact.country_key = country.key
GROUP BY
  country.continent;
-- get based on quarter
SELECT
  country.short_name,
  month.quarter,
  month.year,
  ROUND(AVG(fact.avg_births)) as births,
  ROUND(AVG(fact.avg_births)) as deaths,
  ROUND(AVG(fact.hdi), 2) as hd
from
  fact
  INNER JOIN month ON fact.date_key = month.key
  INNER JOIN country ON fact.country_key = country.key
GROUP BY
  month.year,
  month.quarter,
  country.short_name
ORDER BY
  month.year,
  month.quarter;
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
  *
from
  fact
  INNER JOIN education ON fact.education_key = education.key
  INNER JOIN country ON fact.country_key = country.key
GROUP BY
  fact.key,
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
select
  sum(population_growth),
  --I dont know if this is actually right
  month.year
from
  fact
  inner join population on Fact.population_key = population.key
  inner join month on fact.date_key = month.key
group by
  month.year
order by
  sum(population_growth) desc
limit
  5 -- ii) find the five countries with the highest decreases
  -- in term of specific health conditions (e.g., tuberculosis) in
  -- subpopulations {children, male, female, total} when considering a
  -- particular decade.
  -- b. Windowing queries. For instance, display the ranking of the countries
  -- in terms of the literacy rates, as reported per gender, over the last five
  -- years.
  -- c. Using the Window clause. For instance, compare the number of
  -- hospital beds in Canada in 2019 to that of the previous and next years.