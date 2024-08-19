import gurobipy as py
from gurobipy import GRB
import itertools as it


class optimizer_flow:
    def __init__(self,params):
        self.City = params['City']
        self.Department = params['Department']
        self.Relocation_benifit = params['Relocation_benifit']
        self.comm_pair = params['comm_pair']
        self.comm_city_travel_cost = params['comm_city_travel_cost']
        self.comm_department_qty = params['comm_department_qty']
        self.depart_comm = params['depart_comm']
        self.travel = py.Model(name = "decentralization")
        
    def declare_solver(self):
        self.Variable()
        self.constraint()
        self.Objective()
        for v in self.travel.getVars():
            if v.X>0.01:
                print(v.VarName,'-',v.X)
        
    def Variable(self):
        # to check weather a particular department is present in a particular city
        self.location  =  self.travel.addVars(self.Department,self.City,vtype = GRB.BINARY, name = 'location_dep_city')
        #to check the communication between two department present in two different cities 
        self.comm = self.travel.addVars(self.comm_pair,vtype = GRB.BINARY, name = 'comm_pair')
    
    def constraint(self):
        # A particular city should not have  more than three departments
        self.travel.addConstrs((py.quicksum(self.location[i,j] for i in self.Department)<=3 for j in self.City ), name  =  'department_limit')
        # every department should be present in atleast one city
        self.travel.addConstrs((py.quicksum(self.location[i,j] for j in self.City )==1 for i in self.Department), name  =  'city_limit')
        #communication between two depprtment is possible only when both of them are present in the city given by comm_pair
        self.travel.addConstrs(self.comm[i,j,k,l]<= self.location[i,j] for i,j,k,l in self.comm_pair)
        self.travel.addConstrs(self.comm[i,j,k,l]-self.location[k,l]<=0 for i,j,k,l in self.comm_pair)
        # if there is communication between two departments then both of them should be present in the comm_pair 
        self.travel.addConstrs( self.location[i,j]+self.location[k,l]-self.comm[i,j,k,l]<=1 for i,j,k,l in self.comm_pair)
    def Objective(self):
        self.relocation_profit  =  py.quicksum(self.Relocation_benifit[j,i]*self.location[i,j] for i in self.Department for j in self.City if j!='London')
        self.communication_cost =  py.quicksum(self.comm_city_travel_cost.loc[j,l]*self.comm_department_qty.loc[i,k]*self.comm[i,j,k,l] for i,j,k,l in self.comm_pair if self.Department.index(k)>self.Department.index(i)) 
        self.total_cost =  self.relocation_profit - self.communication_cost
        self.travel.setObjective(self.total_cost,GRB.MAXIMIZE)
        self.travel.write('lp.lp')
        self.travel.update()
        self.travel.optimize()