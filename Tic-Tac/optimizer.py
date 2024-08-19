import gurobipy as gb
from gurobipy import GRB

class optimizer_flow:
    def __init__(self,params):
        self.block = params['block']
        self.lines_d = params['lines']
        self.tic_tac =  gb.Model('tic_tac_toe')
    
    def decision_solver(self):
        self.variables()
        self.constraint()
        self.objective()


    def variables(self):
        self.cross = self.tic_tac.addVars(self.block,vtype = GRB.BINARY, name = 'cross')
        self.lines  = self.tic_tac.addVars(self.lines_d,vtype = GRB.BINARY, name = 'lines')
    def constraint(self):
        #totoal no of crosss and nought in the cube shoul be equivalent to the the given value
        self.tic_tac.addConstr((gb.quicksum(self.cross)==14),name = 'cross')
        self.tic_tac.addConstrs((self.cross[l[0]]+self.cross[l[1]]+self.cross[l[2]]-self.lines[l] <=2 for l in self.lines_d ), name = 'lines_constarint')  
        self.tic_tac.addConstrs((self.cross[l[0]]+self.cross[l[1]]+self.cross[l[2]]-self.lines[l] >=1 for l in self.lines_d  ), name = 'cross_constarint')     
    def objective(self):
        self.tic_tac.setObjective(gb.quicksum(self.lines),GRB.MINIMIZE)
        self.tic_tac.write('tic_tac_toe.lp')
        self.tic_tac.update()
        self.tic_tac.optimize()