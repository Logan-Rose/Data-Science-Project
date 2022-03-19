CREATE TABLE Country(
  key INT PRIMARY KEY NOT NULL,
  long_name TEXT,
  short_name TEXT,
  alpha_code TEXT,
  region TEXT,
  currency TEXT,
  income_group TEXT,
  last_census_year INT,
  continent TEXT,
  capital TEXT,
  area INT,
  num_languages INT
);
CREATE TABLE Event(
  key INT PRIMARY KEY NOT NULL,
  seed_id TEXT,
  country TEXT,
  start_year DECIMAL,
  start_month DECIMAL,
  start_day DECIMAL,
  end_year DECIMAL,
  end_month DECIMAL,
  end_day DECIMAL,
  event_type TEXT,
  total_affected DECIMAL,
  total_deaths DECIMAL
);
CREATE TABLE Education(
  key INT PRIMARY KEY NOT NULL,
  female_literacy_rate DECIMAL,
  male_literacy_rate DECIMAL,
  adult_literacy_rate DECIMAL,
  primary_completion_rate_total DECIMAL,
  public_education_spending DECIMAL,
  primary_school_enrollment DECIMAL,
  primary_school_enrollment_female DECIMAL,
  primary_school_enrollment_male DECIMAL,
  secondary_school_enrollment DECIMAL,
  secondary_school_enrollment_female DECIMAL,
  secondary_school_enrollment_male DECIMAL,
  tertiary_school_enrollment DECIMAL
);
CREATE TABLE Health(
  key INT PRIMARY KEY NOT NULL,
  communicable_disease_deaths_percent DECIMAL,
  non_communicable_disease_deaths_percent DECIMAL,
  health_expenditure DECIMAL,
  diabetes_prevalence DECIMAL,
  hospital_beds_per_thousand DECIMAL,
  dpt_immunization_children DECIMAL,
  polio_immunization_infants DECIMAL,
  measles_immunization_toddlers DECIMAL,
  tuberculosis_per_hundred_thousand DECIMAL,
  number_of_nurses_midwives_per_thousand DECIMAL,
  anemia_children_percent DECIMAL,
  percent_children_overweight DECIMAL,
  UHC_service_coverage_index DECIMAL
);
CREATE TABLE Quality_of_Life(
  key INT PRIMARY KEY NOT NULL,
  percent_births_attended_skilled_staff DECIMAL,
  labor_force_participation DECIMAL,
  labor_force_total DECIMAL,
  maternal_leave_benifits DECIMAL,
  mortality_rate_air_quality DECIMAL,
  mortality_rate_unsafe_water DECIMAL,
  practicing_open_defecation DECIMAL,
  access_basic_drinking_water DECIMAL,
  access_to_basic_sanitation DECIMAL,
  access_managed_drinking_water DECIMAL,
  access_to_managed_sanitation DECIMAL,
  poverty_rate DECIMAL,
  female_Unemployment_Rate DECIMAL,
  male_Unemployment_Rate DECIMAL
);
CREATE TABLE Population(
  key INT PRIMARY KEY NOT NULL,
  female_life_expectancy DECIMAL,
  male_life_expectancy DECIMAL,
  total_life_expectancy DECIMAL,
  net_Migration DECIMAL,
  population_growth DECIMAL,
  female_population DECIMAL,
  male_population DECIMAL,
  total_population DECIMAL,
  rural_population_percentage DECIMAL,
  rural_population_growth DECIMAL,
  urban_population_percentage DECIMAL,
  urban_population_growth DECIMAL
);
CREATE TABLE Month(
  key INT PRIMARY KEY NOT NULL,
  name TEXT,
  year INT,
  month_number INT,
  quarter INT,
  decade INT
);
CREATE TABLE FACT(
  key INT PRIMARY KEY NOT NULL,
  country_key INT,
  date_key INT,
  education_key INT,
  health_key INT,
  quality_of_life_key INT,
  event_key INT,
  avg_births DECIMAL,
  avg_deaths DECIMAL,
  HDI DECIMAL
)