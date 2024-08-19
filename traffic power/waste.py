import gurobipy as gp
from gurobipy import Model, GRB

# Create a new model
m = Model("linear_programming")

# Create variables
x1 = m.addVar(name="x1", lb=0)
x2 = m.addVar(name="x2", lb=0)

# Set objective
m.setObjective(5*x1 + 3*x2, GRB.MAXIMIZE)

# Add constraints
m.addConstr(x1 + x2 <= 16, "c0")
m.addConstr(x1 + 4*x2 <= 20, "c1")
m.addConstr(x2 <= 8, "c2")

# Optimize model
m.update()
m.optimize()

m.write('water.lp')

# Print the optimal values of the variables
for v in m.getVars():
    print('%s %g' % (v.varName, v.x))

# Print the optimal value of the objective function
print('Obj: %g' % m.objVal)
