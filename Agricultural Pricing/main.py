import gurobipy as gb 
from gurobipy import GRB
from read_input import read_file
from optimizer import optimizer_flow
"""
PROBLEM STATEMENT :
The government of a country wants to decide what prices should be charged for its dairy products: milk, butter, and cheese
. All these products are produced (directly or indirectly) from the country’s raw milk production operations. This raw milk
production is divided into two main components: fat and dry matter. After subtracting the quantities of fat and dry matter,
which are used for making products for export or consumption on the farms, there is a total yearly availability of 600,000 tons of 
fat and 750,000 tons of dry matter. This is all available for producing milk, butter and two kinds of cheese for domestic 
consumption"""
def main():
    # reading file from input 
    params = read_file()
    # creating an object of the optimizer class with all the required parameters
    obj_val = optimizer_flow(params)
    # calling the decision solver for creating the model and optimizing it and gettting the output in excel format  
    obj_val.decision_solver()
    
main()