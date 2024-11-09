from flask import Flask, render_template, request, jsonify
import pandas as pd
from simulation import *  # Import the simulation function

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')  # Render the main form

@app.route('/optimize', methods=['POST'])
def optimize():
    global result, available_dates

    simulation_df, attendance_df, forecast_data = read_data_from_files()  # Replace with your own function to read data
    result = simulate_2_weeks(simulation_df, attendance_df, forecast_data)

    # Get all unique dates for the date slider
    available_dates = result['date'].unique().tolist()
    
    # Retrieve the selected date from the form data
    selected_date = request.form.get('date', available_dates[0])  # Use the first date if none selected

    # FIlter the result based on the selected date
    filtered_result = result[result['date'] == selected_date]

    # Select tables to display
    wait_times_table = filtered_result[['attraction_name', 'forecast']].to_dict(orient='records')  # Get attraction names and forecast
    opt_wait_times_table = filtered_result[['attraction_name', 'average_wait_time', 'wait_time_difference']].to_dict(orient='records')  # Get optimized data

    # Convert the result DataFrame to HTML
    result_html = filtered_result.to_html(classes='data', header="true", index=False)  

    # Convert columns to a list
    wait_times = filtered_result['forecast'].tolist()  
    opt_wait_times = filtered_result['average_wait_time'].tolist()
    wait_time_diff = filtered_result['wait_time_difference'].tolist()
    
    # If the request is an AJAX call, return JSON data instead of rendering the full page
    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return jsonify({
            'result_html': result_html,
            'wait_times': wait_times,
            'opt_wait_times': opt_wait_times,
            'wait_time_diff': wait_time_diff,
            'wait_times_table': wait_times_table,
            'opt_wait_times_table': opt_wait_times_table,
            'available_dates': available_dates
        })

    # Otherwise, render the full page as usual
    return render_template('index.html',
                           result=result_html,
                           wait_times=wait_times,
                           opt_wait_times=opt_wait_times,
                           wait_time_diff=wait_time_diff,
                           wait_times_table=wait_times_table,
                           opt_wait_times_table=opt_wait_times_table,
                           available_dates=available_dates)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)

