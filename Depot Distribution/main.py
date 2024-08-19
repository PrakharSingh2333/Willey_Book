import gurobipy as gp
from gurobipy import GRB
from read_input import read_file
from optimizer import Optimizerflow 

def main():
    
    params = read_file()
    obj_val = Optimizerflow(params)
    obj_val.decision_solver()
main()
    