import os
import nbformat
from nbconvert.preprocessors import ExecutePreprocessor


# Define paths to the notebooks
notebooks = [
    #"subgroup A/A1_guest_satisfaction_metrics.ipynb",
    "subgroup A/A2_segmentation_model.ipynb",
    "subgroup A/A3_guest_journey_patterns.ipynb",
    "subgroup B/B1_demand_forecasting_model.ipynb",
    "subgroup B/B2_optimise_guest_experience.ipynb",
    "subgroup B/B3_resource_allocation_optimization.ipynb"
]  

def run_notebook(notebook_path):
    """Execute a Jupyter Notebook and handle errors."""
    print(f"Running {notebook_path}...")
    try:
        with open(notebook_path) as f:
            nb = nbformat.read(f, as_version=4)
        ep = ExecutePreprocessor(timeout=600, kernel_name='python3')
        ep.preprocess(nb, {'metadata': {'path': os.path.dirname(notebook_path)}})
        print(f"Completed {notebook_path}\n")
    except Exception as e:
        print(f"Error executing {notebook_path}: {e}\n")

def main():
    for notebook in notebooks:
        run_notebook(notebook)
    print("All notebooks have been executed.")

if __name__ == "__main__":
    main()
