-- Use the database
USE db;

-- Load data from CSV file into final_synthetic_data table
LOAD DATA LOCAL INFILE '../data/final_synthetic_data.csv'
INTO TABLE final_synthetic_data
FIELDS TERMINATED BY ','               -- Adjust delimiter if needed
LINES TERMINATED BY '\n'                -- New line as line separator
IGNORE 2 ROWS;                          -- Ignore header row

-- Load data from CSV file into combined_wait_time_df table
LOAD DATA LOCAL INFILE '../data/combined_wait_time_df.csv'
INTO TABLE combined_wait_time_df
FIELDS TERMINATED BY ','               -- Adjust delimiter if needed
LINES TERMINATED BY '\n'                -- New line as line separator
IGNORE 1 ROWS;                          -- Ignore header row

-- Load data from CSV file into combined_wait_time_df table
LOAD DATA LOCAL INFILE '../data/sentosa_weather_df.csv'
INTO TABLE sentosa_weather_df
FIELDS TERMINATED BY ','               -- Adjust delimiter if needed
LINES TERMINATED BY '\n'                -- New line as line separator
IGNORE 1 ROWS;                          -- Ignore header row

-- Load data from CSV file into collated_forecasts_per_ride table
LOAD DATA LOCAL INFILE '../data/collated_forecasts_per_ride.csv'
INTO TABLE collated_forecasts_per_ride
FIELDS TERMINATED BY ','               -- Adjust delimiter if needed (comma for CSV files)
ENCLOSED BY '"'                         -- Optional, for fields enclosed in quotes
LINES TERMINATED BY '\n'                -- New line as line separator
IGNORE 1 ROWS                          -- Ignore the header row
(@unnamed_column, attraction_name, date, forecast)  -- Define column order, skipping the unnamed index
SET attraction_name = TRIM(BOTH ' ' FROM attraction_name);  -- Remove any leading/trailing spaces from attraction_name

#daily_avg_wait_time_df
-- Load data from CSV file into daily_avg_wait_time_df table
LOAD DATA LOCAL INFILE '../data/daily_avg_wait_time_df.csv'
INTO TABLE daily_avg_wait_time_df
FIELDS TERMINATED BY ','               -- Adjust delimiter if needed
LINES TERMINATED BY '\n'                -- New line as line separator
IGNORE 1 ROWS;                          -- Ignore header row