import gurobipy as gp
from gurobipy import GRB
import itertools as it
from read_input import read_file
class optimizer_flow:
    def __init__(self,params):
        self.raw_material = params['raw_material']
        self.napthas = params['napthas']
        self.oils = params['oils']
        self.distil_material = params['distil_material']
        self.distil_coff = params['distil_coff']
        self.cracking_products_names = params['cracking_products_names']
        self.used_for_motor_fuel_names = params['used_for_motor_fuel_names']
        self.used_for_jet_fuel_names = params['used_for_jet_fuel_names']
        self.buy_limit = params['buy_limit']
        self.distil_cap = params['distil_cap']
        self.reform_cap = params['reform_cap']
        self.cracked_oil_cap = params['cracked_oil_cap']
        self.lu_min = params['lu_min']
        self.lu_max = params['lu_max']
        self.final_prod = params['final_prod']
        self.reform_coff = params['reform_coff']
        self.crackin_coff = params['cracking_coff']
        self.lube_oil_factor = params['lube_oil_factor']
        self.pmf_rmf_ratio = params['pmf_rmf_ratio']
        self.octane_no = params['octane_no']
        self.octane_number_fuel = params['octane_number_fuel']
        self.vapour_cof = params['vapour_coff']
        self.profit = params['profit']
        self.refinery =  gp.Model(name = 'refinery_problem')
        self.blending_coff = params['blending_coff']
        
    def declare_solver(self):
        self.Variables()
        self.capacity_constraints()
        self.mass_balance_constraints()
        self.octane_constraints()
        self.vapour_constraints()
        self.objective()
        self.output()
        
        
        
    def Variables(self):
        # find the no of crude materials is used 
       
        self.crude_qty = self.refinery.addVars(self.raw_material,vtype = GRB.CONTINUOUS,name= 'crude_qty',ub = self.buy_limit)
        
        # find the no of distillate materials is used
        self.distil_qty = self.refinery.addVars(self.distil_material,vtype = GRB.CONTINUOUS,name = 'distil_qty',lb =0)
        # qty of end product formed 
        self.end_prod_qty = self.refinery.addVars(self.final_prod,vtype = GRB.CONTINUOUS,name  =  'final_product_qty',lb = 0)
        self.end_prod_qty["Lube_oil"].LB = self.lu_min
        self.end_prod_qty["Lube_oil"].UB = self.lu_max
        # qty of napthas being used for the tranformation to  reform_gasoline 
        self.reform_usage  =  self.refinery.addVars(self.napthas,vtype = GRB.CONTINUOUS,name = 'napthas_to_reform',lb = 0)
        #qty of napthas being formed from reform_gasoline
        self.reform_gasoline = self.refinery.addVar(name = 'reform_gasoline',vtype = GRB.CONTINUOUS,lb = 0)
        # qty of oils used for the cracking
        self.crack_usage = self.refinery.addVars(self.oils,vtype = GRB.CONTINUOUS,name = 'crack_usage',lb = 0)
        # qty of cracking products formed
        self.crack_prod = self.refinery.addVars(self.cracking_products_names,vtype = GRB.CONTINUOUS,name = 'crack_prod',lb = 0)
        # qty of lube_oil formed
        self.use_for_lube_oil = self.refinery.addVar(name = 'refinery_lube_oil',vtype = GRB.CONTINUOUS,lb = 0)
        # qty used for regular and premium fuel from motor fuel 
        self.used_for_regular_motor_fuel = self.refinery.addVars(self.used_for_motor_fuel_names,vtype = GRB.CONTINUOUS,name = 'used_for_regular_motor_fuel',lb = 0)
        self.used_for_premium_motor_fuel = self.refinery.addVars(self.used_for_motor_fuel_names,vtype = GRB.CONTINUOUS,name = 'used_for_premium_motor_fuel',lb = 0)
        # qty used for  jet fuel used
        self.used_for_jet_fuel = self.refinery.addVars(self.used_for_jet_fuel_names,vtype = GRB.CONTINUOUS,name = 'used_for_jet_fuel',lb = 0)
        self.refinery.update()
    
    def capacity_constraints(self):
        #capacity constraints for different crude oil distillation
        self.refinery.addConstr(self.crude_qty.sum('*')<=self.distil_cap,name = 'distil_capacity')
        # reform_capacity for different naptha reformed per day 
        self.refinery.addConstr(self.distil_qty.sum('*')<=self.reform_cap,name = 'reform_capacity')
        #capacity constraint for cracked_oil
        self.refinery.addConstr(self.crack_usage.sum('*')<=self.cracked_oil_cap,name = 'cracked_oil_capacity')
        # capacity constraint for the premium production wrt regular production
        self.refinery.addConstr(self.end_prod_qty["Premium_fuel"]>=self.end_prod_qty["Regular_fuel"]*self.pmf_rmf_ratio,name = 'premium_capacity')
        #The quantity of distillation products produced depends on the quantity of crude oil used, taking into account the way in which each crude splits under distillation. This gives:
        for distill in self.distil_material:
            self.refinery.addConstr(gp.quicksum(self.distil_coff[raw,distill]*self.crude_qty[raw] for raw in self.raw_material)==self.distil_qty[distill])
        #The quantity of reformed gasoline produced depends on the quantities of naphthas used in the reforming process. This gives the constraint:
        self.refinery.addConstr(gp.quicksum(self.reform_coff[i]*self.reform_usage[i] for i in self.napthas) == self.reform_gasoline,name  =  'reform_gasoline_constraint')
        #The quantity of cracked products produced depends on the quantity of crude oil used, taking into account the way in which each crude splits under distillation. This gives:
        for crack in self.cracking_products_names:
            self.refinery.addConstr(gp.quicksum(self.crackin_coff[oil,crack]*self.crack_usage[oil] for oil in self.oils)==self.crack_prod[crack])
        #the quantity of lube_oil produced depends on the residuum
        self.refinery.addConstr(self.use_for_lube_oil*self.lube_oil_factor == self.end_prod_qty["Lube_oil"],name = 'lube_oil_constraint')
        #The quantity of motor fuels and jet fuel produced is equal to the total quantity of their ingredients. This gives the constraints:
        self.refinery.addConstr(self.used_for_regular_motor_fuel.sum()==self.end_prod_qty["Regular_fuel"],name = 'regular_fuel_constraint')
        self.refinery.addConstr(self.used_for_premium_motor_fuel.sum()==self.end_prod_qty["Premium_fuel"],name = 'premium_fuel_constraint')
        self.refinery.addConstr(self.used_for_jet_fuel.sum()==self.end_prod_qty["Jet_fuel"],name = 'jet_fuel_constraint')
    def mass_balance_constraints(self):
        # The quantities of naphthas used for reforming and blending are equal to the quantities available
        self.refinery.addConstrs((self.reform_usage[i]+self.used_for_regular_motor_fuel[i]+self.used_for_premium_motor_fuel[i]==self.distil_qty[i] for i in self.napthas),name = "Continuity_Naptha")
        #the quantity of light andd heavy oils used for cracking and blending are equal to the quantities available
        self.refinery.addConstrs(self.crack_usage[i]+self.used_for_jet_fuel[i]+self.blending_coff[i]*self.end_prod_qty["Fuel_oil"] == self.distil_qty[i] for i in self.oils)
        #the quantity of cracked oil used for blending is equal to the quantity available
        self.refinery.addConstr(self.used_for_jet_fuel["Cracked_oil"]+self.blending_coff["Cracked_oil"]*self.end_prod_qty["Fuel_oil"] == self.crack_prod["Cracked_oil"],name = 'cracked_oil_constraint')
        #the quanntity of cracked gasoline used for blending is equal to the quantity available
        self.refinery.addConstr(self.used_for_premium_motor_fuel["Cracked_gasoline"]+self.used_for_regular_motor_fuel["Cracked_gasoline"]==self.crack_prod["Cracked_gasoline"],name = 'cracked_gasoline_constraint')
        #the quantity of residuum used for blending is equal to the quantity available
        self.refinery.addConstr(self.use_for_lube_oil+self.used_for_jet_fuel["Residuum"]+self.blending_coff["Residuum"]*self.end_prod_qty["Fuel_oil"] == self.distil_qty["Residuum"],name = 'residuum_constraint')
        #the quantity of reformed gasoline used for blending is equal to the quantity available
        self.refinery.addConstr(self.used_for_regular_motor_fuel["Reformed_gasoline"]+self.used_for_premium_motor_fuel["Reformed_gasoline"]==self.reform_gasoline,name = 'reformed_gasoline_constraint')
    def octane_constraints(self):
        # the octane number of the regular and premium fuel should be atleast 84,94 respectively
        self.refinery.addConstr(gp.quicksum(self.octane_no[i]*self.used_for_premium_motor_fuel[i] for i in self.used_for_motor_fuel_names) >= self.octane_number_fuel["Premium_fuel"]*self.end_prod_qty["Premium_fuel"],name = 'premium_fuel_octane_constraint')
        self.refinery.addConstr(gp.quicksum(self.octane_no[i]*self.used_for_regular_motor_fuel[i] for i in self.used_for_motor_fuel_names) >= self.octane_number_fuel["Regular_fuel"]*self.end_prod_qty["Regular_fuel"],name = 'regular_fuel_octane_constraint')
    def vapour_constraints(self):
        # the vapour fraction of jet fuel should not exceed the maximum value of 1 
        self.refinery.addConstr(gp.quicksum(self.vapour_cof[i]*self.used_for_jet_fuel[i] for i in self.used_for_jet_fuel_names) <= self.end_prod_qty["Jet_fuel"],name = 'jet_fuel_vapour_constraint') 
    def objective(self):
        self.refinery.setObjective(gp.quicksum(self.profit[i]*self.end_prod_qty[i] for i in self.final_prod),GRB.MAXIMIZE)
        self.refinery.optimize() 
    def output(self):
        print("Objective value =", self.refinery.ObjVal)
        for v in self.refinery.getVars():
            # if v.X > 0.0000000001:
            # if v.X > 0:
            print("{} = {}".format(v.VarName, v.X))
        