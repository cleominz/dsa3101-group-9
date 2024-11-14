# Project Title: Enhancing Guest Experience through Data-Driven Journey Mapping and Analysis

# Contents
1. [Introduction](#introduction)
2. [Usage Instructions](#usage-instructions)
3. [Repository Structure](#repository-structure)
4. [Data Sources](#data-sources)
5. [Data Dictionary](#data-dictionary)
6. [API Documentation](#api-documentation)

# Introduction
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

# Usage Instructions
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

# Repository Structure
Below is an overview of the repository structure and what each folder/file contains:
```
dsa3101-group-9/
├── data/                                                   # Folder for storing data files
│   ├── raw_data/                                           # Folder for storing raw data files
│   │   ├── raw_survey_data.csv                             # Contains raw survey data
│   │   ├── raw_tripadvisor_data_source1.csv                # Contains raw TripAdvisor data from our first source
│   │   ├── raw_tripadvisor_data_source2_p1.csv             # Contains raw TripAdvisor data from our second source
│   │   └── raw_tripadvisor_data_source2_p2.csv             # Contains raw TripAdvisor data from our second source
│   ├── collated_forecasts_per_ride.csv                     # Contains predicted forecast data from B1 analysis
│   ├── combined_wait_time_df.csv                           # Contains synthetic wait time data from 2019-2022 and real wait time data from 2023-2024
│   ├── daily_avg_wait_time_df.csv                          # Contains daily average wait time
│   ├── final_synthetic_data.csv                            # Contains synthetic data based on real survey respondents 
│   ├── real_wait_time_data.csv                             # Contains real wait time data from 2023-2024
│   ├── sentosa_weather_df.csv                              # Contains weather data
│   ├── sentosa_data_17features.csv                         # Contains final 17 features after feature engineering
│   ├── survey_data_cleaned.csv                             # Contains cleaned survey data
│   └── tripadvisor_data_cleaned.csv                        # Contains cleaned TripAdvisor data
├── data processing/                                        # Folder for data processing notebooks
│   ├── daily_average_wait_time_generation.ipynb            # Notebook to generate daily average wait time
│   ├── feature_engineering.ipynb                           # Notebook to determine relevant features for further analysis
│   ├── survey_data_analysis.ipynb                          # Conducted exploratory data analysis on survey responses
│   ├── survey_data_cleaning.ipynb                          # Cleaned up survey responses 
│   ├── tripadvisor_data_cleaning.ipynb                     # Cleaning of TripAdvisor data
│   └── wait_data_simple_analysis_and_generation.ipynb      # Analysis of wait time data and generation for earlier years
├── notebooks/                                              # Jupyter Notebooks for optional questions
│   └── Q8_ethics_and_privacy_enhancements/                 # Optional Q8 on ethics and privacy enhancements
│       ├── Q8_ethics_and_privacy_enhancements.ipynb        # Notebook containing Q8 ethics and privacy enhancements
│       └── hypothetical_survey_responses.csv               # Contains hypothetical data used in Q8 notebook
├── simulation/                                             # Folder for simulation, optimization, and app scripts
│   ├── data/                                               # Processed data used for simulation
│   │   ├── attendance_df.csv                               # Processed attendance data for simulations
│   │   ├── collated_forecasts_per_ride.csv                 # Forecasted wait times per ride
│   │   └── simulation_df.csv                               # Collated simulation input data
│   ├── templates/                                          # HTML templates for Flask web application
│   │   └── index.html                                      # Main page template with map and date selector
│   ├── Dockerfile                                          # Docker configuration for containerizing the app
│   ├── app.py                                              # Flask application entry point
│   ├── requirements.txt                                    # Python dependencies for the project
│   └── simulation.py                                       # Python script for simulation
├── sql/                                                    # SQL scripts for database setup and data management
│   ├── db-data.sql                                         # Script to populate the database with data
│   ├── db-schema.sql                                       # Defines the database schema
│   └── exploration of final_synthetic_data.sql             # Script to explore the data using SQL
├── subgroup A/                                             # Folder for Subgroup A's work
│   ├── A1_guest_satisfaction_metrics.ipynb                 # Data analysis and business metrics
│   ├── A2_segmentation_model.ipynb                         # Guest segmentation model
│   └── A3_guest_journey_patterns.ipynb                     # Further analysis on guest journey patterns
├── subgroup B/                                             # Folder for Subgroup B's work
│   ├── B1_demand_forecasting_model.ipynb                   # Demand forecasting model
│   ├── B2_optimise_guest_experience.ipynb                  # Optimisation model to enhance guest experience
│   ├── B3_resource_allocation_optimization.ipynb           # Optimisation model to improve resource allocation
│   └── optional_B2_AI_queue_system.ipynb                   # Implementation of an AI driven queue system
├── main.py                                                 # Python script for running main notebooks
├── README.md                                               # Project documentation (this file)
└── requirements.txt                                        # Python dependencies for setting up the project
```
# Data Sources


# Data Dictionary

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
### 5. Dataset:  `real_wait_time_data.csv`
| Column Name       | Data Type  | Description                                                                | Example Values             |
|-------------------|------------|----------------------------------------------------------------------------|----------------------------|
| `Park`              | object     | The park name.                                                              | "Universal Studios Singapore"      |
| `Date/Time`         | object     | The date and time of observation.                                           | "2023-01-02T11:00:00Z"              |
| `Wait Time`         | int64      | The wait time in minutes.                                                   | 5, 8                     |

### 6. Dataset: `sentosa_weather_df.csv`
| Column Name       | Data Type  | Description                                                                  | Example Values       |
|-------------------|------------|------------------------------------------------------------------------------|----------------------|
| `date`              | object     | The date of the observation in string format (YYYY-MM-DD).                    | "2024-11-10", "2024-11-11" |
| `precipitation`     | float64    | The amount of precipitation (in millimeters) recorded on the given date.      | 0.0, 5.2             |

### 7. Dataset: `survey_data_17features.csv`
| Column Name                                 | Data Type  | Description                                                                 | Example Values                      |
|---------------------------------------------|------------|-----------------------------------------------------------------------------|------------------------------------|
| `gender`                                      | object     | Gender of the respondent.                                                   | "Male", "Female"                    |
| `occupation`                                  | object     | Occupation of the respondent.                                               | "Student", "Employed"               |
| `visitor_profile`                             | object     | Type of visitor profile.                                                    | "Singaporean", "Tourist"            |
| `ticket_purchase_method`                      | object     | Method used to purchase tickets.                                            | "Third Party Vendor (e.g. Klook, Trip.com)", "Resort World Sentosa Website" |
| `ticket_type`                                 | object     | Type of ticket purchased.                                                   | "One-day regular ticket", "Regular ticket with Express Pass" |
| `special_event_ticket`                        | object     | Indicates if a special event ticket was purchased.                          | "Yes", "No"                         |
| `visitor_type`                                | object     | Type of visitor (group or individual).                                      | "Group", "Family"                   |
| `attraction_overall_experience`               | float64    | Overall experience rating of attractions                       | 1.0, 0.75                            |
| `overall_staff_service`                       | float64    | Overall rating of staff service                                 | 1.0, 0.25                            |
| `overall_satisfaction`                        | float64    | Overall satisfaction with the visit                             | 1.0, 0.5                            |
| `return_likelihood`                           | float64    | Likelihood of returning to the park                            | 1.0, 0.25                            |
| `weighted_food_shopping_satisfaction_score`   | float64    | Weighted satisfaction score for food and shopping experiences   | 0.42084422304603                            |
| `total_spend`                                 | float64    | Weighted total amount spent during the visit                            |  1.0                       |
| `weighted_amenities_satisfaction_score`       | float64    | Weighted satisfaction score for amenities                     | 0.7952641755320690                           |
| `weighted_entry_experience_score`             | float64    | Weighted satisfaction score for entry experience              | 0.5506769513521740                            |
| `thrill_seeker_level`                         | float64    | Level of thrill-seeking behavior                               | 1.0                           |
| `age_group`                                   | object     | Age group of the respondent.                                                | Young Adults       |

### 8. Dataset: `tripadvisor_data_cleaned.csv`
| Column Name            | Data Type  | Description                                                        | Example Values                     |
|------------------------|------------|--------------------------------------------------------------------|-----------------------------------|
| `Rating`                 | float64    | Overall rating given by the visitor (1-5 scale).                   | 4.0, 5.0                           |
| `Date of Visit`          | object     | The date the visit occurred, in string format (YYYY-MM-DD).        | "2024-11-10", "2024-11-12"         |
| `Trip Type`              | object     | Type of trip the visitor made.                                     | "Family", "Solo"                 |
| `Month of Visit`         | object     | The month during which the visit occurred.                         | "Jul-Sep", "Oct-Dec"                 |
| `Review Title Cleaned`   | object     | Cleaned version of the review title provided by the visitor.       | "totally overcrowded", "fun"|
| `Review Text Cleaned`    | object     | Cleaned version of the detailed review text by the visitor.        | "awesome time family son best time best place ride also shop lot option food" |
| `Visit Category`         | object     | Category describing the day of visit            | "Weekends"         |

# API Documentation

## Base URL
```
http://localhost:5000
```

## Endpoints

### 1. **Run Optimization Simulation**
- **Endpoint**: `/optimize`
- **Method**: `POST`
- **Description**: Triggers the simulation process and returns wait times for the selected date, both forecasted and optimized.

#### Request
- **Select Date**:
  - `date` (optional): The selected date from the dropdown.

- **Headers**:
  - `X-Requested-With`: `XMLHttpRequest` (to indicate an AJAX request).

##### Example Request (AJAX)
```javascript
const formData = new FormData();
formData.append("date", "2024-11-10");
fetch('/optimize', {
    method: 'POST',
    headers: {
        'X-Requested-With': 'XMLHttpRequest'
    },
    body: formData
})
.then(response => response.json())
.then(data => console.log(data));
```

#### Response
- **Content-Type**: `application/json`
- **Response Body**:
```json
{
  "wait_times_table": [
    {"attraction_name": "[Hollywood] Trolls Hug Time Jubilee", "forecast": 25},
    {"attraction_name": "[New York] Sesame Street Spaghetti Chase", "forecast": 30}
  ],
  "opt_wait_times_table": [
    {"attraction_name": "[Hollywood] Trolls Hug Time Jubilee", "average_wait_time": 20, "wait_time_difference": -5},
    {"attraction_name": "[New York] Sesame Street Spaghetti Chase", "average_wait_time": 25, "wait_time_difference": -5}
  ],
  "wait_times": [25, 30],
  "opt_wait_times": [20, 25],
  "wait_time_diff": [-5, -5]
}
```

##### Explanation
- `wait_times_table`: Contains forecast wait times for attractions.
- `opt_wait_times_table`: Contains optimized wait times and their differences as compared to the forecast wait times.
- `wait_times`: List of forecast wait times for markers on the map.
- `opt_wait_times`: List of optimized wait times for markers on the map.
- `wait_time_diff`: Differences between forecasted and optimized wait times.

## Frontend Integration
The `index.html` file utilizes the `/optimize` endpoint to dynamically update the tables and map based on the selected date.

### Date Dropdown Selection
When the user selects a new date, the AJAX request triggers the `/optimize` endpoint to fetch updated wait times.

#### Relevant Code
```javascript
function updateDate() {
    const selectedDate = document.getElementById("dateDropdown").value;
    const formData = new FormData();
    formData.append("date", selectedDate);

    fetch('/optimize', {
        method: 'POST',
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        // Update the tables and map markers with the new data
        updateTables(data);
        updateMarkers(data.wait_times, false, false);
    });
}
```

### 2. **Home Page**
- **Endpoint**: `/`
- **Method**: `GET`
- **Description**: Renders the main page with a map and tables for forecasted and optimized wait times.

#### Request
No request body needed.

#### Response
- **Content-Type**: `text/html`
- Returns the rendered HTML page with:
  - A date dropdown menu.
  - Buttons to toggle between forecast and optimized wait times.
  - A Leaflet map displaying markers for different attractions with wait times.
  - Tables displaying forecasted and optimized wait times.

### Approach Explanation
- The AJAX-based approach ensures that only the relevant parts of the page (like tables and markers) are updated without a full page refresh.
- The toggle buttons (`#forecast-btn`, `#optimized-btn`) control whether forecasted or optimized wait times are displayed


## Additional Notes
Feel free to experiment with the model and contribute to the project! If you encounter any issues or have suggestions, please visit the Issues section or submit a pull request.
