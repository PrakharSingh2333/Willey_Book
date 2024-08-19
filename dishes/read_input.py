import pandas as pd
import os
curr_path = os.getcwd()

    
def read_data():
    
    """
    Reads input data from Excel files and returns a dictionary of parameters.

    This function imports data from two Excel sheets: "Sheet1" and "Sheet2" in the file "Book1.xlsx".
    The data is stored in two Pandas DataFrames: `input_cost` and `input_requirement`.
    The `input_cost` DataFrame is indexed by "Dishes", and the `input_requirement` DataFrame is also indexed by "Dishes".

    The function returns a dictionary `params` containing the following keys:

    * `input_cost`: The input cost data as a Pandas DataFrame.
    * `input_requirement`: The input requirement data as a Pandas DataFrame.
    * `dishes`: A list of dishes (i.e., the index of the `input_cost` DataFrame).
    * `hours`: A list of hours (i.e., the columns of the `input_requirement` DataFrame).
    * `prev_hours`: A list of previous hours (i.e., all hours except the first one).

    :return: A dictionary of parameters.
    """
    
    params = {}
    # importing the input data from the excel file
    input_cost = pd.read_excel(curr_path+"/Book1.xlsx",sheet_name="Sheet1")
    input_requirement = pd.read_excel(curr_path+"/Book1.xlsx",sheet_name="Sheet2")
    
    # setting the index as Dishes
    input_cost.set_index('Dishes',inplace=True)
    input_requirement.set_index('Dishes',inplace=True)
    
    # storing the input data in the params dictionary
    params['input_cost'] = input_cost
    params['input_requirement'] = input_requirement
    
    # storing the dishes, hours and previous hours in the params dictionary
    params['dishes'] = input_cost.index.to_list()
    params['hours'] = input_requirement.columns.to_list()
    params['prev_hours'] = input_requirement.columns.to_list()[1:]
    params['non sold hours'] = list(range(0,params['hours'][0]))
    
    return params

    
