
import gurobipy as gp
from gurobipy import GRB
import itertools as it
from read_input import read_file
from optimizer import optimizer


def main():
    
    params = read_file()
    opt_obj = optimizer(params)
    
    

"""Set of Decision Variable"""

factory =  gp.Model(name = 'factory_problem')
# QUNATITY of product produce of every type
prod_qty = factory.addVars(Month,Product,vtype = GRB.CONTINUOUS,name =  'produce_qty',lb =0)
#quantity of product stored every month
store_qty = factory.addVars(Month,Product,vtype = GRB.CONTINUOUS,name =  'store_qty',lb =0, ub = max_inventory )
# quantity of product of particular type sold every month
sell_qty = factory.addVars(Month,Product,vtype = GRB.CONTINUOUS,name =  'sell_qty',lb =0,
                           ub = max_sales)

"""Set of Constraint"""

#inventory Balance at the end of june
for i in Product:
  factory.addConstr(store_qty[('Jun',i)]== store_goal)
# storage constraint storage of particular month is equal storage of previous month and the amount left after selling the qty
for i in range(len(Month)):
  if i==0:
    factory.addConstrs((prod_qty[Month[i],j]==store_qty[Month[i],j]+sell_qty[Month[i],j] for j in Product) , name ='storage_constaint1')
  else:
    factory.addConstrs((store_qty[Month[i],j] == store_qty[Month[i-1],j]+prod_qty[Month[i],j]-sell_qty[Month[i],j] for j in Product),name
     = '  storage_constaint')

  # time constraint for the machine working
for mac in machine:
  for m in Month:
    factory.addConstr(gp.quicksum(time_req[mac][p]*prod_qty[m,p] for p in Product if p in time_req[mac])
                     <= hours_per_month*(installed_machine[mac]- down_time.get((m,mac),0)), name=f"time_constraint_{mac}_{m}")

"""Objective"""

# objective is to maximize the profit
obj =  gp.quicksum(profit[j]*prod_qty[i,j]-holding_cost * store_qty[i,j] for i in Month for j in Product)
factory.setObjective(obj,GRB.MAXIMIZE)

factory.optimize()