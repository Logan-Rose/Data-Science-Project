COPY Disaster(
  disaster_key,
  country,
  start_year,
  start_month,
  start_day,
  end_year,
  end_month,
  end_day,
  disaster_group,
  disaster_subgroup,
  disaster_type,
  disaster_subtype,
  total_affected,
  total_disaster_deaths
)
FROM
  '../seeds/Disasters_seed.csv' DELIMITER ',' CSV HEADER