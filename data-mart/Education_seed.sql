COPY Education(
  education_key,
  adult_literacy_rate,
  male_literacy_rate,
  female_literacy_rate,
  primary_school_enrollment,
  primary_school_enrollment_female,
  primary_school_enrollment_male,
  secondary_school_enrollment,
  secondary_school_enrollment_female,
  secondary_school_enrollment_male,
  public_education_spending,
  primary_completion_rate_female,
  primary_completion_rate_male,
  primary_completion_rate_total
)
FROM
  '../seeds/Education_seed.csv' DELIMITER ',' CSV HEADER;