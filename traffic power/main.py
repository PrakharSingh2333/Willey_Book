import gurobipy as gp
from gurobipy import GRB
from optimizer import optimizer_flow
from read_input  import read_file

def main():
    params = read_file()
    obj_val = optimizer_flow(params)
    obj_val.decision_solver()
main()
    