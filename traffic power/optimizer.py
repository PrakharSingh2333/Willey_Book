import gurobipy as gb 
from gurobipy import GRB

class optimizer_flow:
    def __init__(self,params):
        self.Time_period = params['Time_period']
        self.gen_no = params['gen_no']
        self.Num_gentype = params['Num_gentype']
        self.demand = params['demand']
        self.Min_gen_type = params['Min_gen_type']
        self.Max_gen_type = params['Max_gen_type']
        self.Min_cost_per_hour = params['Min_cost_per_hour']
        self.cost_above_minimum_per_hour = params['cost_above_minimum_per_hour']
        self.start_cost_ngen = params['start_cost_ngen']
        self.traffic = gb.Model(name = "Traffic")
        self.maxstart0 =5

    def declare_solver(self):
        self.Variable()
        self.constraint()
        self.objective()

    def Variable(self):
        # tell no of the active generators of each type in every time period
        self.active_gen = self.traffic.addVars(self.gen_no,self.Time_period,vtype = GRB.INTEGER, name = 'active_gen')
        # output of the active generators of each type in every time period
        self.output_gen = self.traffic.addVars(self.gen_no,self.Time_period,vtype = GRB.CONTINUOUS, name = 'output_gen')
        # tell te no of generators to start in every time period to meet the demand 
        self.start_gen =  self.traffic.addVars(self.gen_no,self.Time_period,vtype = GRB.INTEGER, name = 'start_gen')
    def constraint(self):
        # no of active generators of each type should be less than the maximum capacity
        self.traffic.addConstrs(self.active_gen[type,period] <= self.Num_gentype[type] for type in range(self.gen_no) for period in range(self.Time_period))
        # output generated should be greater that the demand at the particular time period 
        self.traffic.addConstrs((gb.quicksum(self.output_gen[type,period] for type in range(self.gen_no))>= self.demand[period] for period in range(self.Time_period)), name = 'demand_constraint')
        # output generated should be greater than the minimum level * no of active generators
        self.traffic.addConstrs((self.output_gen[type,period] >= self.Min_gen_type[type]*self.active_gen[type,period] for type in range(self.gen_no) for period in range(self.Time_period)),name = 'min_constraint')
        # output generated should be less than the maximum level * no of active generators
        self.traffic.addConstrs((self.output_gen[type,period] <= self.Max_gen_type[type]*self.active_gen[type,period] for type in range(self.gen_no) for period in range(self.Time_period)),name = 'max_constraint')  
        # generators must be able to cope with the excess of demand 
        self.traffic.addConstrs((gb.quicksum(self.Max_gen_type[type]*self.active_gen[type,period] for type in range(self.gen_no)) >= 1.15*self.demand[period] for period in range(self.Time_period)),name = 'excess_constraint')
        # Connect the decision variables that capture active generators with the decision variables that count startups
        self.traffic.addConstrs(self.active_gen[type,0] <= self.maxstart0 +self.start_gen[type,0] for type in range(self.gen_no))
        self.traffic.addConstrs(self.active_gen[type,period] <= self.start_gen[type,period]+self.active_gen[type,period-1] for type in range(self.gen_no) for period in range(1,self.Time_period))

    def objective(self):
        