import gurobipy as gp
from gurobipy import GRB
import itertools as it
from read_input import read_file
from output import output_file

class optimizer_flow:
    def __init__(self,params):
        self.blocks = params['blocks']
        self.above_blocks = params['above_blocks']
        self.block_value = params['block_value']
        self.extract_cost = params['extract_cost']
        self.mining = gp.Model('mining')
        self.variables_val_dict = {}
    
    def declare_solver(self):
        self.variables()
        self.constraints()
        self.objective()
        self.output()
    
    def variables(self):
        self.open_blocks  =  self.mining.addVars(self.blocks,ub =1,name = 'open_blocks')
        
    
    def constraints(self):
        for b in self.blocks:
         self.mining.addConstrs(self.open_blocks[a]-self.open_blocks[b]>=0 for a in self.above_blocks[b] )
    def objective(self):
        self.mining.setObjective((gp.quicksum(self.open_blocks[i]*(self.block_value[i]-self.extract_cost[i[0]]) for i in self.blocks)),GRB.MAXIMIZE)
        self.mining.update()
        self.mining.optimize()
    def output(self):
         if self.mining.Status == GRB.OPTIMAL:
            print("Objective value =", self.mining.ObjVal)
            for var in self.mining.getVars():
                if var.x>0.0:
                  print(var.varName, var.x)
        
        