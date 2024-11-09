import numpy as np
import pandas as pd

def read_data_from_files():
    simulation_df = pd.read_csv('data/simulation_df.csv')
    attendance_df = pd.read_csv('data/attendance_df.csv')
    forecast_data = pd.read_csv('data/collated_forecasts_per_ride.csv')
    return simulation_df, attendance_df, forecast_data

def simulate_wait_times(simulation_df, attendance_df, forecast_df, baseline_guests=100, time_interval=60):

    simulation_forecast = pd.merge(simulation_df, forecast_df, on='attraction_name')

    # Operating hours in minutes (e.g., 10 am - 9 pm = 660 minutes) 
    operating_hours = 660
    num_intervals = operating_hours // time_interval

    # Calculate average yearly guests 
    filtered_attendance_df = attendance_df[~attendance_df['Year'].isin([2020, 2021, 2022])]  # To account for COVID-19
    average_yearly_guests = filtered_attendance_df['Attendance'].mean()
    total_forecasted_guests = average_yearly_guests / 365

    simulation_results = []

    # Calculate the sum of estimated capacities for normalization
    estimated_capacity = simulation_forecast['estimated_capacity']
    total_capacity = sum(estimated_capacity)

    # Calculate base guest distribution according to estimated capacities
    base_distribution = [(cap / total_capacity) * total_forecasted_guests for cap in estimated_capacity]

    for index, row in simulation_forecast.iterrows():
        # Extract attraction-specific data
        attraction_name = row['attraction_name']
        optimised_distance = row['optimised_distances']
        popularity_factor = row['popularity_factor']
        date = row['date']
        forecast = row['forecast']

        # Get the corresponding base guests for the attraction
        base_guests = base_distribution[index]

        # Calculate distance factor
        max_distance = simulation_forecast['optimised_distances'].max()
        distance_factor = max(0.1, (max_distance - optimised_distance) / max_distance) if max_distance > 0 else 1

        # Adjust guest distribution with higher popularity influence
        weight_distance = 0.1  
        weight_popularity = 1
        weight_forecast = 0.25

        # Calculate guests per interval based on capacity and factors
        guests_per_interval = (
            (base_guests * 0.15) *
            (distance_factor * weight_distance + popularity_factor * weight_popularity + forecast * weight_forecast) + baseline_guests
        )

        # Debugging: Print the calculated values
        # print(f"Attraction: {attraction_name}")
        # print(f"  Base Guests: {base_guests}, Distance Factor: {distance_factor}, Popularity Weight: {popularity_factor}")
        # print(f"  Estimated Capacity: {estimated_capacity[index]}, Guests per Interval: {guests_per_interval}")

        # Initialize wait time tracking
        queue = 0
        wait_times = []

        # Simulate each time interval
        for t in range(num_intervals):
            arrivals = guests_per_interval
            processed = arrivals + queue  # No cap on processing
            queue = max(processed - estimated_capacity[index], 0)  # Update queue if exceeds capacity
            wait_time = (queue / estimated_capacity[index]) * time_interval if estimated_capacity[index] > 0 else 0
            wait_times.append(wait_time)

        # Store results for this attraction
        simulation_results.append({
            'attraction_name': attraction_name,
            'date': date,
            'average_wait_time': np.mean(wait_times),
            'max_wait_time': np.max(wait_times),
            'total_wait_time': np.sum(wait_times)
        })

    simulation_result = pd.DataFrame(simulation_results)

    # Merge the two DataFrames on 'attraction_name'
    merged_results = pd.merge(simulation_result[['attraction_name', 'date', 'average_wait_time']], simulation_forecast[['attraction_name', 'forecast']], on='attraction_name')

    # Calculate the difference between average_wait_time and forecast
    merged_results['wait_time_difference'] = merged_results['average_wait_time'] - merged_results['forecast']

    # Round the necessary columns to 1 decimal place
    merged_results['average_wait_time'] = merged_results['average_wait_time'].round(1)
    merged_results['forecast'] = merged_results['forecast'].round(1)
    merged_results['wait_time_difference'] = merged_results['wait_time_difference'].round(1)

    # Total decrease in wait time
    wait_time_decrease = merged_results['wait_time_difference'].sum()

    return merged_results


def simulate_2_weeks(simulation_df, attendance_df, forecast_data):
    unique_dates = forecast_data['date'].unique()

    # Initialize final_results as an empty DataFrame
    final_results = pd.DataFrame()

    for date in unique_dates:
        daily_forecast = forecast_data.loc[forecast_data['date'] == date, ['attraction_name', 'forecast', 'date']]
        simulation_results = simulate_wait_times(simulation_df, attendance_df, daily_forecast)

        # Concatenate the simulation_results DataFrame with final_results
        final_results = pd.concat([final_results, simulation_results], ignore_index=True)

    return final_results

