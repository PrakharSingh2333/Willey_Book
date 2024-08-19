import gurobipy as gp
from gurobipy import GRB
from optimizer import optimizer_flow
from read_input import read_file
from output import output_file
def main():
    params = read_file()
    obj_val = optimizer_flow(params)
    obj_val.declare_solver()
    
    
main()
    
    
    