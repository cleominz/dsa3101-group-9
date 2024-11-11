# Project Title: Enhancing Guest Experience through Data-Driven Journey Mapping and Analysis

## Contents
1. [Introduction](#introduction)
2. [Usage Instructions](#usage-instructions)
3. [Repository Structure](#repository-structure)
4. [Data Sources](#data-sources)
5. [Data Dictionary](#data-dictionary)
6. [API Documentation](#api-documentation)

## Introduction
**Overview:** 
This project aims to enhance guest experiences at Universal Studios Singapore through a comprehensive, data-driven analysis of the guest journey. By employing advanced data analysis, machine learning, and predictive modeling, we seek to identify bottlenecks, optimize guest flow, personalize experiences, and ultimately boost guest satisfaction while potentially increasing revenue and operational efficiency.

**The project includes:**
- Generation of synthetic data based on patterns found in real data.
- Use of SQL for data extraction and transformation.
- Data cleaning, analysis, and visualisation of guest journey data.
- A predictive model that clusters guest behavior.
- An API to serve model predictions and key insights.

**Team Members**
- Cai Zhenxin
- Clara Nai Ying Fei
- Ng Rui Bin Damien
- Li Yuan
- Bi Yuying
- Chang Jin Lynn
- Li Ziyu Edwards
- Lee Yan Le Ryan

## Usage Instructions
To run/test the app locally, follow these step-by-step instructions:
### Step 1: Clone the Repository
First, clone the repository to your local machine using the command below:
- git clone https://github.com/cleominz/dsa3101-group-9.git

### Step 2: Install Dependencies
Install required packages using:
- pip install -r requirements.txt

### Step 3: Running the Application
Ensure that Docker is up and running. Navigate to the simulation directory and run the commands below: 
- docker build -t flask-app .
- docker tun -p 5001:5001 flask-app

## Repository Structure
Below is an overview of the repository structure and what each folder/file contains:
```
dsa3101-group-9/
├── data/                                                   # Folder for storing raw data files
│   ├── collated_forecasts_per_ride.csv                     # Contains predicted forecast data from B1 analysis
│   ├── combined_wait_time_df.csv                           # Contains synthetic wait time data from 2019-2022 and real wait time data from 2023-2024
│   ├── daily_avg_wait_time_df.csv                          # Contains daily average wait time
│   ├── final_synthetic_data.csv                            # Contains synthetic data based on real survey respondents 
│   ├── sentosa_weather_df.csv                              # Contains weather data
│   └── real_wait_time_data.csv                             # Contains real wait time data from 2023-2024
├── notebooks/                                              # Jupyter Notebooks for data analysis and visualization
│   └── eda.ipynb                                           # Exploratory Data Analysis (EDA) notebook
├── sql/                                                    # SQL scripts for database setup and data management
│   ├── db-schema.sql                                       # Defines the database schema
│   ├── db-data.sql                                         # Script to populate the database with data
│   └── exploration of final_synthetic_data.sql             # Script to explore the final_synthetic_data.csv using SQL
├── simulation/                                             # Folder for simulation, optimization, and app scripts
│   ├── data/                                               # Processed data used for simulation
│   │   ├── attendance_df.csv                               # Processed attendance data for simulations
│   │   ├── collated_forecasts_per_ride.csv                 # Forecasted wait times per ride
│   │   └── simulation_df.csv                               # Collated simulation input data
│   ├── templates/                                          # HTML templates for Flask web application
│   │   └── index.html                                      # Main page template with map and date selector
│   ├── Dockerfile                                          # Docker configuration for containerizing the app
│   ├── requirements.txt                                    # Python dependencies for the project
│   ├── app.py                                              # Flask application entry point
│   └── simulation.py                                       # Python script for simulation
├── subgroup A/                                             # Folder for Subgroup A's work
│   ├── A1.ipynb                                            # Data analysis and insights by Subgroup A
│   ├── A2.ipynb                                            # Additional analysis by Subgroup A
│   └── A3.ipynb                                            # Further analysis and reporting by Subgroup A
├── subgroup B/                                             # Folder for Subgroup B's work
│   ├── B1_wait_data_simple_analysis_and_generation.ipynb   # Analysis and generation of wait time data
│   ├── B1_demand_forecasting_model.ipynb                   # Demand forecasting model
│   ├── B2_optimise_guest_experience.ipynb                  # Optimisation model to enhance guest experience
│   ├── B3_resource_allocation_optimization.ipynb           # Optimisation model to improve resource allocation
│   └── optional_B2_AI_queue_system.ipynb                   # Implementation of an AI driven queue system
├── README.md                                               # Project documentation (this file)
├── requirements.txt                                        # Python dependencies for setting up the project
└── .gitignore                                              # Specifies files and folders to ignore in Git
```
## Data Sources


## Data Dictionary

### 1. Dataset: `collated_forecasts_per_ride.csv`
| Column Name        | Data Type  | Description                                                              | Example Values        |
|--------------------|------------|--------------------------------------------------------------------------|-----------------------|
| `attraction_name`    | object     | Name of the attraction for which the wait time is forecasted.         | "[Hollywood] Trolls Hug Time Jubilee", "[New York] Sesame Street Spaghetti Chase" |
| `date`               | object     | Date for which the wait time forecast is made    | "2024-10-24", "2024-10-25" |
| `forecast`           | float64    | The predicted wait time (in minutes) for the attraction on the given date.| 5.1068515011681200           |

### 2. Dataset: `combined_wait_time_df.csv`
| Column Name       | Data Type  | Description                                                                | Example Values             |
|-------------------|------------|----------------------------------------------------------------------------|----------------------------|
| `datetime`          | object     | The full datetime value.                                              | "2019-01-01 08:45:00+00:00"      |
| `year`              | int64      | The year of the observation.                                                | 2019, 2020                 |
| `month`             | int64      | The month of the observation (1 = January, 12 = December).                  | 11, 12                     |
| `day_of_week`       | int64      | The day of the week (1 = Monday, 7 = Sunday).                              | 0, 1, 2                    |
| `date`              | object     | The date in string format (YYYY-MM-DD).                                     | "2024-05-18", "2024-05-19" |
| `time`              | object     | The time portion of the observation in string format (HH:MM:SS).            | "08:30:00", "14:45:00"     |
| `hour`              | int64      | The hour of the observation (0 to 23).                                      | 8, 14                      |
| `wait_time`         | float64    | The recorded wait time in minutes.                                          | 8.352688081432390                 |

### 3. Dataset: `daily_avg_wait_time_df.csv`
| Column Name         | Data Type  | Description                                                              | Example Values       |
|---------------------|------------|--------------------------------------------------------------------------|----------------------|
| `date`                | object     | The date of the observation in string format (YYYY-MM-DD).               | "2024-11-10", "2024-11-11" |
| `avg_wait_time_day`   | float64    | The average wait time for the day, in minutes.                           | 12.5, 18.0           |
| `wait_time_rating`    | int64      | A rating indicating the quality of the wait time (1-5 scale).     | 3, 4, 5              |

### 4. Dataset: `final_synthetic_data.csv`
| Column Name                                                                                                 | Data Type   | Description                                                                                     | Example Values                      |
|------------------------------------------------------------------------------------------------------------|-------------|-------------------------------------------------------------------------------------------------|------------------------------------|
| `age`                                                                                                      | object      | Age of the respondent                                                                            | "18-25", "26-35"                   |
| `gender`                                                                                                   | object      | Gender of the respondent                                                                         | "Male", "Female"          |
| `occupation`                                                                                               | object      | Occupation of the respondent                                                                     | "Student", "Employed"              |
| `visitor_profile`                                                                                          | object      | Type of visitor                                               | "Singaporean", "Tourist"          |
| `ticket_purchase_method`                                                                                   | object      | Method used to purchase tickets                                                                  | "Third Party Vendor (e.g. Klook, Trip.com)", "Resort World Sentosa Website"                 |
| `ticket_type`                                                                                              | object      | Type of ticket purchased                                                                         | "Regular ticket with Express Pass", "One-day regular ticket"        |
| `special_event_ticket`                                                                                     | object      | Whether the respondent purchased a special event ticket                                          | "Yes", "No"                        |
| `ticket_purchase_ease`                                                                                     | int64       | Ease of ticket purchasing process (1-5 scale)                                                    | 4                                  |
| `visitor_type`                                                                                            | object      | Visitor type                                                             | "Group", "Family"                 |
| `what are your preferred attraction(s)? select all that apply.`                                            | object      | Preferred attractions selected by the respondent                                                 | "Thrill Rides, Shows"     |
| `visit_month`                                                                                              | object      | Month of visit                                                                                   | "Jan - Mar", "Apr - Jun"              |
| `visit_day`                                                                                                | object      | Day of the week for the visit                                                                    | "Weekdays", "Weekdays during Public/School Holidays"               |
| `arrival_experience`                                                                                       | int64       | Rating of arrival experience (1-5 scale)                                                         | 3                                  |
| `queue_time_at_entry`                                                                                      | object      | Reported queue time at entry                                                                     | "< 5 mins", "10 - 20 mins"                    |
| `entry_staff_service`                                                                                      | object      | Satisfaction with entry staff service                                                 | "Yes", "No"                                 |
| `which attraction(s) did you visit? (select all that apply)`                                               | object      | Attractions visited during the visit                                                             | "[Sci-Fi City] Battlestar Galatica: HUMAN vs CYLON, [Sci-Fi City] TRANSFORMERS The Ride: The Ultimate 3D Battle, [Sci-Fi City] TRANSFORMERS: Voices of Cybertron"       |
| `attraction_wait_time`                                                                                     | int64       | Average wait time (1-5 scale)                                                     | 4                                 |
| `used_express_pass`                                                                                       | object      | Whether the respondent used an express pass                                                      | "Yes", "No"                        |
| `express_pass_satisfaction`                                                                                | float64     | Satisfaction with the express pass (1-5 scale)                                                   | 4                                |
| `attraction_staff_service`                                                                                 | int64       | Rating of staff service at attractions (1-5 scale)                                               | 4                                  |
| `attraction_overall_experience`                                                                            | int64       | Overall experience at the attractions (1-5 scale)                                                | 5                                  |
| `shopping_purchase`                                                                                       | object      | Whether the respondent made a purchase at the park stores                                        | "Yes", "No"                        |
| `which store(s) did you visit? (select all that apply)`                                                    | object      | Stores visited by the respondent                                                                 | "[Hollywood] Universal Studios Store, [Hollywood] Minion Mart, [Far Far Away] Fairy Godmother's Potion Shop"           |
| `merchandise_spend`                                                                                       | object      | Total amount spent on merchandise                                                                | "$20 - $30"                         |
| `merchandise_price_reasonable`                                                                             | int64       | Rating of merchandise price reasonableness (1-5 scale)                                           | 3                                  |
| `merchandise_variety`                                                                                      | int64       | Satisfaction with the variety of merchandise (1-5 scale)                                         | 4                                  |
| `food_purchase`                                                                                           | object      | Whether the respondent purchased food                                                            | "Yes", "No"                        |
| `if your answer was "yes" above, which food outlet(s) did you visit? (select all that apply)`              | object      | Food outlets visited                                                                             | "[Hollywood] Mel's Drive-In, [Sci-Fi City] Frozen Fuel"   |
| `food_variety`                                                                                            | int64       | Satisfaction with food variety (1-5 scale)                                                       | 5                                  |
| `food_quality`                                                                                            | int64       | Satisfaction with food quality (1-5 scale)                                                       | 4                                  |
| `food_price_reasonable`                                                                                   | int64       | Satisfaction with food price reasonableness (1-5 scale)                                          | 4                                  |
| `food_spend`                                                                                              | object      | Total amount spent on food                                                                       | "$10 - $20"                          |
| `food_wait_time`                                                                                          | object      | Reported wait time for food                                                                      | "5 - 10 mins"                    |
| `visit_issues_resolved`                                                                                   | object      | Whether any issues during the visit were resolved                                                | "No issues", "Yes, issue resolved"                        |
| `overall_staff_service`                                                                                   | int64       | Overall rating of staff service (1-5 scale)                                                     | 4                                  |
| `park_cleanliness`                                                                                       | int64       | Rating of park cleanliness (1-5 scale)                                                          | 5                                  |
| `park_seating_availability`                                                                               | object      | Satisfaction with seating availability                                                           | "Yes", "No"       |
| `restroom_accessibility`                                                                                  | int64       | Rating of restroom accessibility (1-5 scale)                                                    | 4                                  |
| `overall_satisfaction`                                                                                    | int64       | Overall satisfaction with the visit (1-5 scale)                                                 | 5                                  |
| `which aspect of your visit was the most disappointing?`                                                  | object      | Aspects of the visit that were disappointing                                                    | "Long wait times, Overcrowded attractions"                |
| `return_likelihood`                                                                                      | object      | Likelihood of returning to the park                                                             | "Yes", "Maybe"               |
| `recommendation_likelihood`                                                                               | object      | Likelihood of recommending the park                                                             | "Yes", "No"               |
| `additional_comments`                                                                                     | object      | Free-text comments provided by respondents                                                     | "lesser wait time"                |
| `source`                                                                                                  | object      | Source of data                                                                      | "real", "synthetic"            |
### 5. Dataset: `sentosa_weather_df.csv`
| Column Name       | Data Type  | Description                                                                  | Example Values       |
|-------------------|------------|------------------------------------------------------------------------------|----------------------|
| `date`              | object     | The date of the observation in string format (YYYY-MM-DD).                    | "2024-11-10", "2024-11-11" |
| `precipitation`     | float64    | The amount of precipitation (in millimeters) recorded on the given date.      | 0.0, 5.2             |

### 6. Dataset:  `real_wait_time_data.csv`
| Column Name       | Data Type  | Description                                                                | Example Values             |
|-------------------|------------|----------------------------------------------------------------------------|----------------------------|
| `Park`              | object     | The park name.                                                              | "Universal Studios Singapore"      |
| `Date/Time`         | object     | The date and time of observation.                                           | "2023-01-02T11:00:00Z"              |
| `Wait Time`         | int64      | The wait time in minutes.                                                   | 5, 8                     |

## API Documentation

## Additional Notes
Feel free to experiment with the model and contribute to the project! If you encounter any issues or have suggestions, please visit the Issues section or submit a pull request.
