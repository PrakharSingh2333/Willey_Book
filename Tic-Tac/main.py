import gurobipy as py
from gurobipy import GRB
from read_input import read_file
from optimizer import optimizer_flow

def main():
     input = read_file()
     obj_val = optimizer_flow(input)
     obj_val.decision_solver()
main()
