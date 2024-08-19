import gurobipy as gb
from gurobipy import GRB
from read_input import read_file

class optimizer_flow:
    def __init__(self,params):
        self.input =  params
        self.curve = gb.Model('curve fitting')
        self.observations  = [row for row in self.input.index ]
       
        
    def decision_solver(self):
        self.Variables()
        self.Constraints()
        self.Objective()
        self.curve.optimize()
        #print(self.curve.ObjVal)
    def Variables(self):
        self.slope =  self.curve.addVar(vtype = GRB.CONTINUOUS,lb = -GRB.INFINITY,ub = GRB.INFINITY, name = 'slope' )
        self.intercept =  self.curve.addVar(vtype = GRB.CONTINUOUS,lb = -GRB.INFINITY,ub = GRB.INFINITY, name = 'intercept')
        self
        self.posiive_deviation =  self.curve.addVars(self.observations,vtype = GRB.CONTINUOUS, name = 'positive_deviation')
        self.negative_deviation =  self.curve.addVars(self.observations,vtype= GRB.CONTINUOUS, name = 'negative_deviation')
        self.total_deviation =  self.curve.addVar(vtype = GRB.CONTINUOUS, name = 'total_deviation')
    def Constraints(self):
        self.curve.addConstrs(self.total_deviation>=self.posiive_deviation[i] for i in self.observations)
        self.curve.addConstrs(self.total_deviation>=self.negative_deviation[i] for i in self.observations)
        self.curve.addConstrs((self.input.loc[ row , 'X']*self.slope + self.intercept+self.posiive_deviation[row]-self.negative_deviation[row] == self.input.loc[row,'Y'] for row in self.observations) , name  = 'equality_constraint for deviation')
    def Objective(self):
        self.curve.setObjective(self.total_deviation,GRB.MINIMIZE)
        self.curve.update()
        self.curve.optimize()
        