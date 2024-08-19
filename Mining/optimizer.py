import gurobipy as py
from gurobipy import GRB

class optimizer_flow:
    def __init__(self,params):
        self.Mines = params['Mines']
        self.Quality = params['Quality']
        self.Royalties=params['Royalties']
        self.Upper_Limit = params['Upper_Limit']
        self.Years = params['Years']
        self.blend_target = params['blend_target']
        self.price = params['price']
        self.year_disc = params['year_disc']
        self.mining = py.Model('mining')
    def declare_solver(self):
        self.variables()
        self.constraints()
        self.objective()
        self.mining.optimize()
    def variables(self):
        #to check weather the mine is open or not 
        self.open = self.mining.addVars(self.Mines,self.Years,vtype=py.GRB.BINARY,name='open')   
        # to check weather the mine is working or not after being open 
        self.working =  self.mining.addVars(self.Mines,self.Years,vtype =GRB.BINARY,name = 'working')
        #the quantity of ore  produced from mines in every year
        self.extract =  self.mining.addVars(self.Mines,self.Years,vtype = GRB.CONTINUOUS,name = 'extract_qty')
        # the quantity of blend_ore produced every year 
        self.produce = self.mining.addVars(self.Years,vtype = GRB.CONTINUOUS,name  =  'Produuced_qty')
    def constraints(self):
        # no of open mines in a year should be less than 3 
        self.mining.addConstrs((py.quicksum(self.open[m,t] for m in self.Mines) <=3 for t in self.Years), name = 'open_mines_limitS')
        # capacity_constraint extract ore should be less than the upper linit of mines 
        for t in self.Years:
            self.mining.addConstrs((self.extract[m,t] <=self.Upper_Limit[m]*self.working[m,t] for m in self.Mines) ,name = 'capacity_constraint')
        # mass balance constraint -  The quantity of ore extracted from mines should be equal to the quantity of ore produced in every year
        for t in self.Years:
            self.mining.addConstr(py.quicksum(self.extract[m,t] for m in self.Mines)==self.produce[t],name = 'mass balance')
        # The quality of the ore from the mines multiplied by the amount that is mined must equal the needed blend quality multiplied by the quantity of blended ore. This ensures that the quality standards are satisfied 
        for t in self.Years:
            self.mining.addConstr(py.quicksum(self.Quality[m]*self.extract[m,t] for m in self.Mines)==self.blend_target[t]*self.produce[t],name  =  'quality constraint')
        # Only open mines should be working 
        self.mining.addConstrs((self.working[m,t]<=self.open[m,t] for m in self.Mines for t in self.Years), name  =  'working constraint')
        #once the mine is shutdown it cannt be opened again for extraction of ore 
        self.mining.addConstrs((self.open[m,t+1]<=self.open[m,t] for m in self.Mines for t in self.Years[:-1]),name = 'opening constraint')
    def objective(self):
        obj  = py.quicksum(self.produce[t]*self.price*self.year_disc[t] for t in self.Years)-py.quicksum(self.Royalties[m]*self.open[m,t]*self.year_disc[t] for m in self.Mines for t in self.Years)
        self.mining.setObjective(obj,GRB.MAXIMIZE)
        