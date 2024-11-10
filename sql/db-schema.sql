-- Create Database
CREATE DATABASE IF NOT EXISTS db;

-- Use the new database
USE db;

-- Create Table Structure for final_synthetic_data
CREATE TABLE IF NOT EXISTS final_synthetic_data (
    age VARCHAR(10),
    gender VARCHAR(10),
    occupation VARCHAR(50),
    visitor_profile VARCHAR(50),
    ticket_purchase_method VARCHAR(50),
    ticket_type VARCHAR(50),
    special_event_ticket VARCHAR(50),
    ticket_purchase_ease INT,
    visitor_type VARCHAR(50),
    preferred_attractions TEXT,
    visit_month VARCHAR(20),
    visit_day VARCHAR(20),
    arrival_experience INT,
    queue_time_at_entry VARCHAR(20),
    entry_staff_service VARCHAR(20),
    visited_attractions TEXT,
    attraction_wait_time INT,
    used_express_pass VARCHAR(20),
    express_pass_satisfaction FLOAT,
    attraction_staff_service INT,
    attraction_overall_experience INT,
    shopping_purchase VARCHAR(50),
    visited_stores TEXT,
    merchandise_spend VARCHAR(20),
    merchandise_price_reasonable INT,
    merchandise_variety INT,
    food_purchase VARCHAR(20),
    visited_food_outlets TEXT,
    food_variety INT,
    food_quality INT,
    food_price_reasonable INT,
    food_spend VARCHAR(20),
    food_wait_time VARCHAR(20),
    visit_issues_resolved VARCHAR(20),
    overall_staff_service INT,
    park_cleanliness INT,
    park_seating_availability VARCHAR(20),
    restroom_accessibility INT,
    overall_satisfaction INT,
    disappointing_aspect TEXT,
    return_likelihood VARCHAR(20),
    recommendation_likelihood VARCHAR(20),
    additional_comments TEXT,
    source VARCHAR(50)
);

-- Create Table Structure for combined_wait_time_df
CREATE TABLE IF NOT EXISTS combined_wait_time_df (
    datetime TIMESTAMP PRIMARY KEY,
    year INT,
    month INT,
    day_of_week INT, 
    date DATE,
    time TIME,
    hour INT,
    wait_time FLOAT
);

-- Create Table Structure for sentosa_weather_df
CREATE TABLE IF NOT EXISTS sentosa_weather_df (
    date DATE PRIMARY KEY,
    precipitation FLOAT
);

-- Create Table Structure for collated_forecasts_per_ride
CREATE TABLE IF NOT EXISTS collated_forecasts_per_ride (
    index_col INT,
    attraction_name VARCHAR(255),
    date DATE,
    forecast FLOAT
);

-- Create Table Structure for daily_avg_wait_time_df
CREATE TABLE IF NOT EXISTS daily_avg_wait_time_df (
    date DATE PRIMARY KEY,
    avg_wait_time_day FLOAT,
    wait_time_rating INT
);