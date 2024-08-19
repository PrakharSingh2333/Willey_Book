import gurobipy as gb
from gurobipy import GRB
from read_input import read_file
from optimizer import optimizer_flow 


def main():
    params = read_file()
    obj_crr = optimizer_flow(params)
    obj_crr.decision_solver()
main()
    