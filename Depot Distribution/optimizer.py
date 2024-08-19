import gurobipy as gp
from gurobipy import GRB
import pandas as pd

class OptimizerFlow:
    def __init__(self,params):
        self.input = params['input']
        self.columns = params['column']
        self.Customers = params['Customers']
        self.Depot = params['Depot']
        self.New_Depot = params['New_Depot']
        self.Capacity = params['Capacity']
        self.Demand = params['Demand']
        self.Factory = params['Factory']
        self.DepotModel = gp.Model("DepotModel")
        self.depot_cost = dict(zip(["Bristol", "Northampton", "Birmingham"],[12000,4000,3000]))
        self.depot_save = dict(zip(["Newcastle","Exeter"],[10000,5000]))
    def decision_solver(self):
        self.Variables()
        self.Constraints()
        self.Objective()
        self.output()
        
        
    def Variables(self):
        # amounnt of goods supplied from depot or factory to customer and from factory to depot 
        self.Customer_from_depot_or_factory = self.DepotModel.addVars(((c,d) for c  in  self.Customers for d in self.columns if self.input.loc[c,d]!=0), vtype = GRB.CONTINUOUS, name = "Customer_from_depot_or_factory")
        self.Depot_from_factory = self.DepotModel.addVars(((d,f) for d in self.Depot for f in self.Factory if self.input.loc[d,f]!=0), vtype = GRB.CONTINUOUS, name = "Depot_from_factory")
        # to check weather which factory is active or not
        self.active_depot = self.DepotModel.addVars(self.Depot,vtype= GRB.BINARY, name  = 'active_depot')
    
    
    def Constraints(self):
        # Amount of good s supplied from the factory to  the customers should be more then the demand of customer 
        self.DepotModel.addConstrs((gp.quicksum(self.Customer_from_depot_or_factory[c,d] for d in self.columns if self.input.loc[c,d]!=0) >= self.Demand[c] 
                                    for c in self.Customers), name = "Demand_Constraint")
        #Amount of gud supplied from the faactory should nor exceed the capacity of factory 
        self.DepotModel.addConstrs((gp.quicksum(self.Customer_from_depot_or_factory[c,d]for c in self.Customers if self.input.loc[c,d]!=0)+gp.quicksum(self.Depot_from_factory[f,d] for f in self.Depot if self.input.loc[f,d]!=0) <= self.Capacity[d] for d in self.Factory),name  = 'Capacity_constraint _factory')
        self.DepotModel.addConstrs((gp.quicksum(self.Depot_from_factory[d,f] for f in self.Factory if self.input.loc[d,f]!=0) <= self.Capacity[d]*self.active_depot[d] for d in self.New_Depot),name  = 'Capacity_constraint _New_depot')
        # self.DepotModel.addConstrs((gp.quicksum(self.Depot_from_factory[d,f] for f in self.Factory if self.input.loc[d,f]!=0) <= self.Capacity[d] for d in self.Depot),name  = 'Capacity_constraint _New_depot')
        # amount of supply to depot shoould be eual to amount being supplied from depot to customer 
        self.DepotModel.addConstrs((gp.quicksum(self.Customer_from_depot_or_factory[c,d] for c in self.Customers if self.input.loc[c,d]!=0)== gp.quicksum(self.Depot_from_factory[d,f] for f in self.Factory if self.input.loc[d,f]!=0) for d in self.Depot),name = 'Flow_balance_constraint_depot')
        # Atmost only 4 dedpot should be active at a time 
        self.DepotModel.addConstr(gp.quicksum(self.active_depot[d] for d in self.New_Depot)<=2,name = 'active_depot_constraint')
        # for expansion of birmingham constraint 
        self.DepotModel.addConstr(gp.quicksum(self.Depot_from_factory['Birmingham',f] for f in self.Factory if self.input.loc['Birmingham',f]!=0)<= self.Capacity['Birmingham']+20000*self.active_depot['Birmingham'],name = 'expansion_constraint')
    
    
    def Objective(self):
         #cost of supply of guds from the factort to depot 
        self.Cost_from_depot_or_factory= gp.quicksum(self.Customer_from_depot_or_factory[c,d]*self.input.loc[c,d] for c in self.Customers for d in self.columns if self.input.loc[c,d]!=0)
        #amount of supply to customer from factory and depot to customer 
        self.cost_from_factory_to_depot  = gp.quicksum(self.Depot_from_factory[d,f]*self.input.loc[d,f] for f in self.Factory for d in self.Depot if self.input.loc[d,f]!=0) 
        #amount used to open a new depot 
        self.New_depot_cost  =  gp.quicksum(self.active_depot[d]*self.depot_cost[d] for d in self.depot_cost.keys())
        #amount saved from closing the two depot 
        self.Cost_Depot_save = gp.quicksum(self.active_depot[d]*self.depot_save[d] for d in self.depot_save.keys())
        self.DepotModel.setObjective(self.Cost_from_depot_or_factory + self.cost_from_factory_to_depot + self.New_depot_cost +self.Cost_Depot_save-15000, GRB.MINIMIZE)
        
        self.DepotModel.optimize()
        self.DepotModel.write("lp.lp")
    def output(self):
        print("The total cost of supply is : ",self.DepotModel.objVal)
        df  = pd.DataFrame([],columns=self.columns,index = list(self.Depot)+list(self.Customers)).fillna(0)
        
        for i,j in self.Customer_from_depot_or_factory.keys():
            if self.Customer_from_depot_or_factory[i,j].x>0:
                df.loc[i,j] = self.Customer_from_depot_or_factory[i,j].X
        for d,f in self.Depot_from_factory.keys():
            if self.Depot_from_factory[d,f].x>0:
                df.loc[d,f] = self.Depot_from_factory[d,f].X
        df.to_excel('output.xlsx')
    