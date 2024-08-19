import gurobipy as gp
from gurobipy import GRB
import itertools as it
from read_input import read_file
from optimizer import optimizer_flow

def main():
    params = read_file()
    
    opt_obj = optimizer_flow(params)
    opt_obj.declare_solver()
main()    
    