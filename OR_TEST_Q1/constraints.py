class Constraints:

    def non_sold_food_constraint(self, model, vars, data):
        """
        This constraint maintains the fact that for first 5 hours there will not be any sold food
        """
        for hour in data['non sold hours']:
            for dish in data['dishes']:
                stock_from_previous = sum(vars.used[hour-k][hour, dish] for k in range(0,min(hour, data['metrics'].loc[dish]['shelf_life'])))
                model.addConstr(stock_from_previous 
                                == 0, name = f'sold_food_constraint_for_{hour}_and_{dish}')
                
    def sold_food_constraint(self, model, vars, data):
        """
        This constraint maintains the fact that the food used from the current hour all the previous hour upto the expiration hour
        should be equal to the sold amount of food
        """
        for hour in data["hours"]:
            for dish in data["dishes"]:
                stock_from_previous = sum(vars.used[hour-k][hour, dish] for k in range(0,min(hour, data['metrics'].loc[dish]['shelf_life'])))
                model.addConstr(stock_from_previous 
                                == data['requirement'].loc[hour][dish] - vars.unfilled_demand[hour, dish],
                                name = f'sold_food_constraint_for_{hour}_and_{dish}')
                
    def wasted_food_constraint(self, model, vars, data):
        """
        This constraint maintains the fact that the food prepared in this hour should be equal to 
        whatever amount is used in the cuurrent hour + whatever amount will be used in the next hours
        upto the expiration hour
        """
        for hour in data['non sold hours'] + data["hours"]:
            for dish in data["dishes"]:
                prepare = 10*vars.dummy[hour, dish]
                stock_for_future = sum(vars.used[hour][hour + k, dish] for k in range(0, min(data['metrics'].loc[dish]['shelf_life'], data['hours'][-1] - hour)))
                model.addConstr(prepare == stock_for_future + vars.wasted[hour, dish],
                                name = f'wasted_food_for_{hour}_and_{dish}')
                
