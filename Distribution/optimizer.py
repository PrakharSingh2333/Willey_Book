import gurobipy as gp
from gurobipy import GRB
import pandas as pd 

class optimizer_flow:
    def __init__(self,params):
        self.input = params['input']
        self.Capacity = params['capacity']
        self.Demand = params['Demand']
        self.Customer = params['Customer']
        self.Depot = params['Depot']
        self.factory = params['Factory']
        self.Distribution = gp.Model(name  = 'Distribution')
      
        
    def decision_solver(self):
        self.Variables()
        self.constraint()
        self.objective()
        self.output()
        
    def Variables(self):
        # amount recieved by customer by depot and facility 
        self.Customer_from__depot_or_factory  =  self.Distribution.addVars(((c,d) for c in self.Customer for d in self.Depot+self.factory if self.input.loc[c,d]!=0),vtype  = GRB.CONTINUOUS, name = 'Customer_depot_or_factory')
        # amount recieved by depot from factory 
        self.Depot_from_factory = self.Distribution.addVars(((d,f) for d in self.Depot for f in self.factory if self.input.loc[d,f]!=0),vtype  = GRB.CONTINUOUS, name = 'Depot_from_factory')
    def constraint(self):
        #amount supplied to customer should be equal to demand of customer
        self.Distribution.addConstrs((gp.quicksum(self.Customer_from__depot_or_factory[c,d] for d in self.Depot+self.factory if self.input.loc[c,d]!=0) >= self.Demand[c] for c in self.Customer),name  = 'Demand_constraint _for_customer')
        # amount supplied should not exceed the capacity of factory or depot 
        self.Distribution.addConstrs((gp.quicksum(self.Customer_from__depot_or_factory[c,d]for c in self.Customer if self.input.loc[c,d]!=0)+gp.quicksum(self.Depot_from_factory[f,d] for f in self.Depot if self.input.loc[f,d]!=0) <= self.Capacity[d] for d in self.factory),name  = 'Capacity_constraint _factory')
        self.Distribution.addConstrs((gp.quicksum(self.Depot_from_factory[d,f] for f in self.factory if self.input.loc[d,f]!=0) <= self.Capacity[d] for d in self.Depot),name  = 'Capacity_constraint _depot')
        # amount of supply to depot shoould be eual to amount being supplied from depot to customer 
        self.Distribution.addConstrs((gp.quicksum(self.Customer_from__depot_or_factory[c,d] for c in self.Customer if self.input.loc[c,d]!=0)== gp.quicksum(self.Depot_from_factory[d,f] for f in self.factory if self.input.loc[d,f]!=0) for d in self.Depot),name = 'Flow_balance_constraint_depot')
    def objective(self):
        #cost of supply of guds from the factort to depot 
        self.Cost_from_depot_or_factory= gp.quicksum(self.Customer_from__depot_or_factory[c,d]*self.input.loc[c,d] for c in self.Customer for d in self.Depot+self.factory if self.input.loc[c,d]!=0)
        #amount of supply to customer from factory and depot to customer 
        self.cost_from_factory_to_depot  = gp.quicksum(self.Depot_from_factory[d,f]*self.input.loc[d,f] for f in self.factory for d in self.Depot if self.input.loc[d,f]!=0) 
        self.Distribution.setObjective(self.Cost_from_depot_or_factory+self.cost_from_factory_to_depot,GRB.MINIMIZE)
        
        self.Distribution.optimize()
    def output(self):
        print("The Distribution cost is {}".format(self.Distribution.ObjVal))
        self.df = pd.DataFrame([],columns= self.factory+self.Depot,index = self.Depot+self.Customer).fillna(0)
        for i, j in self.Customer_from__depot_or_factory.keys():
            self.df.loc[i,j] = self.Customer_from__depot_or_factory[i,j].X
        for i,j  in self.Depot_from_factory.keys():
            self.df.loc[i,j] = self.Depot_from_factory[i,j].X
        self.df.to_excel('output.xlsx')
        
        
            
    