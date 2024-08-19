import gurobipy as gp
from gurobipy import GRB
from  read_input import read_data
from optimizer import optimizer_flow

"""PROBLEM STATEMENT
You own a restaurant. Restaurant can prepare 20 dishes. Every dish has to be prepared in multiples of 10 for optimal cost and 
lasts for 3-10 hours depending on dish. If profit on dish i on selling is p(i) and loss on dish i on wastage is l(i), loss on
missing customer demand is m(i) and dish i lasts for l(i) hours, How many dishes should restaurant prepare on a day hourly:
Prepare(i, h) where i is dish #, h is hr # lying between 0 to 20. Requirement for each dish by hr is R(i, h) where i is dish #,
h is hr # lying between 5 to 23"""


def main():
    # to read the input data from the excel file
    params = read_data()
    
    # to create an object of the optimizer class with all the required parameters
    obj_val = optimizer_flow(params)
    
    # to call the decision solver for creating the model and optimizing it and gettting the output in excel format
    obj_val.build_model()

main()