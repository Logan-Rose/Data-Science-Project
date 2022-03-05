CREATE TABLE Country(
  country_key TEXT PRIMARY KEY NOT NULL,
  country_name TEXT,
  region TEXT,
  continent TEXT,
  currency TEXT,
  capital TEXT,
  total_population INT,
  birthrate DECIMAL
);
CREATE TABLE Month(
  month_key TEXT PRIMARY KEY NOT NULL,
  month_name TEXT,
  quarter INT,
  year INT,
  decade INT
);
CREATE TABLE Education(
  education_key TEXT PRIMARY KEY NOT NULL,
  male_literacy_rate DECIMAL,
  female_literacy_rate DECIMAL,
  total_literacy_rate DECIMAL,
  primary_school_enrolment DECIMAL,
  secondary_school_enrolment DECIMAL,
  public_education_spending DECIMAL -- 12 more attributes at least
);
CREATE TABLE Health(
  health_key TEXT PRIMARY KEY NOT NULL,
  health_expenditure DECIMAL,
  Hospital_beds INT,
  Hepatitis_immunization_rate DECIMAL,
  dpt_immunization_rate DECIMAL,
  measles_immunization_rate DECIMAL,
  polio_immunization_rate DECIMAL,
  stillbirths INT,
  infant_mortality DECIMAL,
  number_of_doctors INT,
  number_of_nurses INT,
  hiv_prevalence_male DECIMAL,
  hiv_prevalence_female DECIMAL
);
CREATE TABLE Quality_of_Life(
  Quality_of_life_key TEXT PRIMARY KEY NOT NULL,
  Access_to_Drinking_Water DECIMAL,
  Access_to_Sanitation DECIMAL,
  Access_to_Basic_Handwashing_Facilities DECIMAL,
  Male_Unemployment_Rate DECIMAL,
  Female_Unemployment_Rate DECIMAL,
  Total_Unemployment_Rate DECIMAL,
);
CREATE TABLE Population(
  Quality_of_life_key TEXT PRIMARY KEY NOT NULL,
  Male_Life_Expectancy DECIMAL,
  Female_Life_Expectancy DECIMAL,
  Total_Life_Expectancy DECIMAL,
  Net_Migration DECIMAL,
  Rrural_population_percentage DECIMAL,
  Urban_population_percentage DECIMAL,
  population_growth DECIMAL,
  poverty_rate DECIMAL,
);
CREATE TABLE Event(
  event_key TEXT PRIMARY KEY NOT NULL,
  event_name TEXT,
  event_description TEXT,
  start_date DATE,
  end_date DATE,
  start_month INT,
  end_month INT,
  outcome DECIMAL
);