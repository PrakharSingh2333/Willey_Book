from gurobipy import Model
from input_data import input
from decision_variables import variables
from constraints import Constraints
from objective import Objective
from output_data import Output

def Main():
    # Define the Model
    model = Model()

    # Reading the input data
    reader = input()
    data = reader.read_input()

    # Make the decision variables
    vars = variables()
    # Add dummy used variables
    vars.create_dummy_prepared_variables(model, data)
    # Add used variables
    vars.create_used_variables(model, data)
    # Add wasted variables
    vars.create_wasted_variables(model, data)
    # Add unfilled demand variables
    vars.create_unfilled_demand_variables(model, data)

    # Add the constraints
    const = Constraints()
    # Non sold food constraint
    const.non_sold_food_constraint(model, vars, data)
    # Add sold food constraint
    const.sold_food_constraint(model, vars, data)
    # Add wasted food constaint
    const.wasted_food_constraint(model, vars, data)

    # Define the objective function
    obj = Objective()
    obj.obj_fun(model, vars, data)

    # Print the output data
    out = Output()
    out.write_output(model, vars, data)


if __name__ == "__main__":
    Main()