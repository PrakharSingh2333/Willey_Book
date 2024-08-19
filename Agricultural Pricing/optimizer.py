import gurobipy as gb 
from gurobipy import GRB
import pandas as pd

class optimizer_flow():
    def __init__(self,params):
        self.input = params['input']
        self.Prod = params['Prod']
        self.Content = params['Content']
        self.Consumption = params['Consumption']
        self.Previous_Price = params['Previous_Price']
        self.Elasticity = params['Elasticity']
        self.capacity = params['Capacity']
        self.Elasticity12 = 0.1
        self.Elasticity21 = 0.4
        self.PriceIndex = 1.939
        self.Pricing = gb.Model('Pricing')
    
    def decision_solver(self):
        #calling Variables and Constraints functions
        
        self.Variables()
        self.Constraints()
        self.objective()
        
        #calling output function for output
        self.output()
    
    def Variables(self):
        # Demand of each product in 1000 tons
        
        self.demand = self.Pricing.addVars(self.Prod,vtype=GRB.CONTINUOUS,lb=0,name = 'demand_of_product')
        
        # Price of each Product 
        
        self.price = self.Pricing.addVars(self.Prod,vtype=GRB.CONTINUOUS,lb=0,name = 'price_of_product')
        
    def Constraints(self):
        
        # Capacity Constraint
        
        self.Pricing.addConstrs((gb.quicksum(self.input.loc[d,c]*self.demand[d]*0.01 for d in self.Prod)<= self.capacity[c] 
                                 for c in self.Content),name =  'capacity_constraint')
        
        #Consumption quantity of all the product * price of product == priceIndex
        
        self.Pricing.addConstr(gb.quicksum(self.Consumption[d]*self.price[d] for d in self.Prod)
                               <= self.PriceIndex,name = 'price_constraint')
        
        #elasticity Constraint for milk 
        
        self.Pricing.addConstr(-self.Elasticity['Milk']*(self.price['Milk']-self.Previous_Price['Milk'])/self.Previous_Price['Milk']
                               == (self.demand['Milk']-self.Consumption['Milk'])/self.Consumption['Milk'],name = 'elasticity_constraint_for_Milk')
        # elasticity Constraiint for Butter'
        
        self.Pricing.addConstr(-self.Elasticity['Butter']*(self.price['Butter']-self.Previous_Price['Butter'])
                               /self.Previous_Price['Butter'] == (self.demand['Butter']-self.Consumption['Butter'])
                               /self.Consumption['Butter'],name = 'elasticity_constraint_for_Butter')
        
        #elasticity Constraint for Cheese 1
        
        self.Pricing.addConstr(self.Elasticity12*(self.price['Cheese 2']-self.Previous_Price['Cheese 2'])
                               /self.Previous_Price['Cheese 2']-self.Elasticity['Cheese 1']*(self.price['Cheese 1']
        -self.Previous_Price['Cheese 1'])/self.Previous_Price['Cheese 1'] == (self.demand['Cheese 1']
            -self.Consumption['Cheese 1'])/self.Consumption['Cheese 1'],name = 'elasticity_constraint_for_Cheese 1')
        
        #elasticity Constraint for Cheese 2
        
        self.Pricing.addConstr(self.Elasticity21*(self.price['Cheese 1']-self.Previous_Price['Cheese 1'])
                /self.Previous_Price['Cheese 1']-self.Elasticity['Cheese 2']*(self.price['Cheese 2']
         -self.Previous_Price['Cheese 2'])/self.Previous_Price['Cheese 2'] == (self.demand['Cheese 2']
        -self.Consumption['Cheese 2'])/self.Consumption['Cheese 2'],name = 'elasticity_constraint_for_Cheese 2')
    
    def objective(self):
        # objective to maximumize revenue for all the products 
        self.Pricing.setObjective(gb.quicksum(self.price[i]*self.demand[i] for i in self.Prod),GRB.MAXIMIZE)
        self.Pricing.write('lp.lp')
        self.Pricing.optimize()
    
    def output(self):
        print(f"The Total Revenue is : {round(self.Pricing.ObjVal*1e6):.2f}")
        #Making Dataframe for having price and demand of each product
        df = pd.DataFrame([],columns = ['Price','Demand'],index = self.Prod)
        for j in self.price.keys():
            df.loc[j,'Price'] = f"${round(self.price[j].x * 1000):.2f}"
        for j in self.demand.keys():
            df.loc[j,'Demand'] = round(self.demand[j].x*1e6)
        df.rename_axis('Product', inplace=True)
        
        df.to_excel('output.xlsx')
"""
Constraints :
    1. Capacity Constraint - Amount of product should be less than or equal to capacity 
    2. Price Constraint - Price of product should be less than or equal to Price Index
    3. Elasticity Constraint- Elasticity of product should be less than or equal to Elasticity given in input
"""