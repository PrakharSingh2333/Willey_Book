import gurobipy as gb 
from gurobipy import GRB
from read_input import read_file

class optimizer_flow:
    def __init__(self,input):
       self.input  = input 
       self.retailers = self.input['Retailer']
       self.Market_shares = gb.Model('Market_Shares')
       self.delivery_5 = self.input['Delivery Points'].sum()*0.05
       self.delivery_40 = self.input['Delivery Points'].sum()*0.4
       self.spirit_5 =  self.input['Spirit Market (10^6 gallons)'].sum()*0.05
       self.spirit_40 = self.input['Spirit Market (10^6 gallons)'].sum()*0.4
       self.oil_region1_40 = self.input.loc[self.input['Region']==1,'Oil Market (10^6 gallons)'].sum()*0.4
       self.oil_region1_5 = self.input.loc[self.input['Region']==1,'Oil Market (10^6 gallons)'].sum()*0.05
       self.oil_region2_40 = self.input.loc[self.input['Region']==2,'Oil Market (10^6 gallons)'].sum()*0.4
       self.oil_region2_5 = self.input.loc[self.input['Region']==2,'Oil Market (10^6 gallons)'].sum()*0.05
       self.oil_region3_40 = self.input.loc[self.input['Region']==3,'Oil Market (10^6 gallons)'].sum()*0.4
       self.oil_region3_5 = self.input.loc[self.input['Region']==3,'Oil Market (10^6 gallons)'].sum()*0.05
       self.retailersA_40 = self.input.loc[self.input['Growth Category']=='A','Retailer'].count()*0.4
       self.retailersA_5 =  self.input.loc[self.input['Growth Category']=='A','Retailer'].count()*0.05
       self.retailersB_40 = self.input.loc[self.input['Growth Category']=='B','Retailer'].count()*0.4
       self.retailersB_5 = self.input.loc[self.input['Growth Category']=='B','Retailer'].count()*0.05
       
       
    def declare_solver(self):
        self.variables()
        self.constraints()
        self.objective()
        self.Market_shares.optimize()
        self.output()
        
    
    def variables(self):
        # to check weather the particular retailer is assigned to division D1 or not 
        self.allocate = self.Market_shares.addVars(self.retailers,vtype = GRB.BINARY, name  = 'allocation') 
        # measures positive deviation of  retailer goal to satisfy the 40% of the delivery points
        self.delivery_pos =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.delivery_5, name = 'delivery_pos_deviation')
        # measures negative Deviation of retailers goal to satisfy the 40% of the delivery points
        self.delivery_neg =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.delivery_5, name = 'delivery_neg_deviation')
        # measure negative deviation of retailers goal to satisfy the 40% of the spirit Market 
        self.spirit_neg = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.spirit_5, name = 'spirit_neg_deviation')
        # measure positive deviation of retailers goal to satisfy the 40% of the spirit Market 
        self.spirit_pos = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.spirit_5, name = 'spirit_pos_deviation')
        # measures negative deviation of retailers goal to satisfy the 40% of the Oil Market
        self.oil1_neg = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region1_5, name = 'oil_neg_deviation')
        # measures positive deviation of retailers goal to satisfy the 40% of the Oil Market
        self.oil1_pos = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region1_5, name = 'oil_pos_deviation')
        # measures negative deviation of retailers goal to satisfy the 40% of the Oil Market in region 2 
        self.oil2_neg = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region2_5, name = 'oil2_neg_deviation')
        # measures positive deviation of retailers goal to satisfy the 40% of the Oil Market in region 2
        self.oil2_pos = self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region2_5, name = 'oil2_pos_deviation')
        #measures negative deviation of retailers goal to satisfy the 40% of the Oil Market in region 3
        self.oil3_pos =  self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region3_5, name = 'oil3_pos_deviation')
        #measures positive deviation of retailers goal to satisfy the 40% of the Oil Market in region 3
        self.oil3_neg =  self.Market_shares.addVar(vtype = GRB.CONTINUOUS,ub = self.oil_region3_5, name = 'oil3_neg_deviation')
        # measures the positive deviation of retailers goal to satisfy the 40% of the Retailers in group  A
        self.retailer_A_pos =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.retailersA_5, name = 'retailer_A_pos_deviation')
        # measures the negative deviation of retailers goal to satisfy the 40% of the Retailers in group  A
        self.retailer_A_neg  =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.retailersA_5, name = 'retailer_A_neg_deviation')
        # measures the positive deviation of retailers goal to satisfy the 40% of the Retailers in group  B
        self.retailer_B_pos =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.retailersB_5, name = 'retailer_B_pos_deviation')
        # measures the negative deviation of retailers goal to satisfy the 40% of the Retailers in group  B
        self.retailer_B_neg =  self.Market_shares.addVar(vtype=GRB.CONTINUOUS,ub = self.retailersB_5, name = 'retailer_B_neg_deviation')    
        
    def constraints(self):
        # allocation of retailers in division 1 such that they satify the 40 percent constraint of the delivery points 
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i]*self.input.loc[self.input['Retailer']==i,'Delivery Points'] for i in self.retailers)+self.delivery_pos-self.delivery_neg == self.delivery_40),name = 'allocation_constraint_delivery_points')
        # allocation of retailers in division 1 such that they satisfy the 40 percent constraint of the spirit Market
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i]*self.input.loc[self.input['Retailer']==i ,'Spirit Market (10^6 gallons)'] for i in self.retailers)+self.spirit_pos-self.spirit_neg == self.spirit_40),name = 'allocation_constraint_spirit_market')
        # allocation of retailers in division 1 such that they satisfy the 40 percent constraint of the Oil Market in region 1
        
        

        self.Market_shares.addConstr(gb.quicksum(self.allocate[i]*self.input.loc[self.input['Retailer']==i,'Oil Market (10^6 gallons)'] 
                                                  for i in self.retailers 
                                                  if self.input.loc[self.input['Retailer']==i,'Region'].values[0]==1 
                                                #   else 0
                                                  )
                                                  
                                      +self.oil1_pos-self.oil1_neg 
                                      == self.oil_region1_40,name = 'allocation_constraint_oil_market_region1')
        
        
        # allocation of retailers in division 1 such that they satisfy the 40 percent constraint of the Oil Market in region 2
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i]*self.input.loc[self.input['Retailer']==i ,'Oil Market (10^6 gallons)'] 
                                                  for i in self.retailers 
                                                  if self.input.loc[self.input['Retailer']==i,'Region'].values[0]==2 
                                                  )
                                      +self.oil2_pos-self.oil2_neg == self.oil_region2_40),name = 'allocation_constraint_oil_market_region2')
        
        # allocation of retailer in division 1 such that they satisfy the 40 percent constraint of the Oil Market in region 3
        
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i]*self.input.loc[self.input['Retailer']==i ,'Oil Market (10^6 gallons)'] 
                                                  for i in self.retailers 
                                                  if self.input.loc[self.input['Retailer']==i,'Region'].values[0]==3 )
                                      +self.oil3_pos-self.oil3_neg == self.oil_region3_40),name = 'allocation_constraint_oil_market_region3')
        # allocation of retailers in division 1 such that they satisfy the 40 percent constraint of the Retailers in group  A
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i] for i in self.retailers if self.input.loc[self.input['Retailer']==i,'Growth Category'].values[0] == 'A')+self.retailer_A_pos-self.retailer_A_neg == self.retailersA_40),name = 'allocation_constraint_retailers_A')
        # allocation of retailer in division 1 such that they satisfy the 40 percent constraint of the Retailers in group  B
        self.Market_shares.addConstr((gb.quicksum(self.allocate[i] for i in self.retailers if self.input.loc[self.input['Retailer']==i,'Growth Category'].values[0] == 'B')+self.retailer_B_pos-self.retailer_B_neg == self.retailersB_40),name = 'allocation_constraint_retailers_B')

    def objective(self):
        total_deviation  =  self.delivery_neg+self.delivery_pos+self.spirit_neg+self.spirit_pos+self.oil1_neg+self.oil1_pos+self.oil2_neg+self.oil2_pos+self.oil3_neg+self.oil3_pos+self.retailer_A_neg+self.retailer_A_pos+self.retailer_B_neg+self.retailer_B_pos
        self.Market_shares.setObjective(total_deviation,GRB.MINIMIZE)
        self.Market_shares.write('output1.lp')
    def output(self):
        
        
        