from gurobipy import GRB, quicksum

class Objective:
    def obj_fun(self, model, vars, data):
        """
        This function defines the objective as the 
        sum(sold_food*profit - wasted_food*loss_due_to_wastage - unfilled_demand*loss_due_to_unfulfillment)
        over all the hour and all the dishes
        """
        # Define the objective
        obj = model.setObjective(
            quicksum(
                (data['requirement'].loc[hour][dish]*data['metrics'].loc[dish]['shelf_life']
                - vars.unfilled_demand[hour, dish])*data['metrics'].loc[dish]['Profit']
                for hour in data['hours'] for dish in data['dishes']
            )
            - quicksum(
                vars.wasted[hour, dish]*data['metrics'].loc[dish]['Loss_on_wastage']
                for hour in  data['hours'] for dish in data['dishes']
            )
            - quicksum(
                vars.unfilled_demand[hour, dish]*data['metrics'].loc[dish]['Loss_on_demand']
                for hour in data['hours'] for dish in data['dishes']
            )
            , GRB.MAXIMIZE
        )

        # Optimize the Model
        model.optimize()

        # Print the results
        if model.status == GRB.OPTIMAL:
            print(model.ObjVal)
        else:
            print('No Optimal Solution found!')