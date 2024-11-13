
-- Using the Terminal to initialise the database 'db'

-- Using the terminal, go to the folder where the database files are located 
-- Connect to the MySQL server using the mysql command-line client with the following command:

```$> mysql --local-infile=1 -u root -p```

-- Enter your password when prompted. 
-- Execute the db-schema.sql script to create the database structure, and execute the db-data.sql script to populate the database structure, by using the following commands:

```sql
mysql> SOURCE db-schema.sql;
mysql> SOURCE db-data.sql;
```

-- SQL scripts for data extraction and transformation
-- 1. Extract visitor demographic information along with their visit details
SELECT 
    age,
    gender,
    occupation,
    visitor_profile,
    visit_month,
    visit_day,
    ticket_type,
    attraction_overall_experience,
    overall_satisfaction,
    return_likelihood
FROM final_synthetic_data
WHERE 
    overall_satisfaction IS NOT NULL 
    AND attraction_overall_experience IS NOT NULL;


-- 2. Calculate average satisfaction and return likelihood by visitor profile and month
SELECT 
    visitor_profile,
    visit_month,
    AVG(overall_satisfaction) AS avg_satisfaction,
    AVG(CASE 
        WHEN return_likelihood = 'Yes' THEN 1 
        ELSE 0 
    END) AS return_rate
FROM final_synthetic_data
GROUP BY visitor_profile, visit_month
ORDER BY visitor_profile, visit_month;


-- 3. Convert satisfaction scores into categories
SELECT 
    CASE 
        WHEN overall_satisfaction >= 4 THEN 'High'
        WHEN overall_satisfaction = 3 THEN 'Medium'
        ELSE 'Low'
    END AS satisfaction_level,
    COUNT(*) AS count_of_visitors
FROM final_synthetic_data
GROUP BY satisfaction_level;


-- 4. Analyze food purchase behavior and satisfaction
SELECT 
    food_purchase,
    AVG(food_variety) AS avg_food_variety,
    AVG(food_quality) AS avg_food_quality,
    AVG(food_price_reasonable) AS avg_price_reasonableness,
    SUM(CASE WHEN food_purchase = 'Yes' THEN 1 ELSE 0 END) AS total_food_purchases
FROM final_synthetic_data
GROUP BY food_purchase;


-- 5. Count visitors who selected "Thrill Rides" as one of their preferred attractions
SELECT 
    COUNT(*) AS thrill_ride_lovers
FROM final_synthetic_data
WHERE `preferred_attractions` LIKE '%Thrill Rides%';


-- combined_wait_time_df
-- 1. Calculate average wait time for each month in 2023, 2024
SELECT month, AVG(wait_time) AS avg_wait_time
FROM combined_wait_time_df
WHERE year IN (2023, 2024)
GROUP BY month
ORDER BY month;


-- 2. Calculate average wait time by day of the week in 2023, 2024
SELECT day_of_week, AVG(wait_time) AS avg_wait_time
FROM combined_wait_time_df
WHERE year IN (2023, 2024)
GROUP BY day_of_week
ORDER BY day_of_week;


-- 3. Calculate average hourly distribution of wait time in one day in 2023, 2024
SELECT hour, AVG(wait_time) AS avg_wait_time
FROM combined_wait_time_df
WHERE year IN (2023, 2024)
GROUP BY hour
ORDER BY hour;


-- 4. Calculate average wait time for each day in 2023, 2024
SELECT date, AVG(wait_time) AS avg_wait_time
FROM combined_wait_time_df
WHERE year IN (2023, 2024)
GROUP BY date
ORDER BY date;


-- sentosa_weather_df and combined_wait_time_df
-- 1. Missing dates from combined_wait_time_df
SELECT DISTINCT w.date
FROM sentosa_weather_df w LEFT JOIN combined_wait_time_df t ON w.date=t.date
WHERE t.date IS NULL
AND w.date <= ALL (SELECT MAX(date) FROM combined_wait_time_df)
ORDER BY date;