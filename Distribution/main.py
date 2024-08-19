import gurobipy as gp
from gurobipy import GRB
from read_input import read_file
from optimizer import optimizer_flow

def main():
    params = read_file()
    obj_val = optimizer_flow(params)
    obj_val.decision_solver()
main()