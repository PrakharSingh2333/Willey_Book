from gurobipy import GRB

class variables:
    
    def create_dummy_prepared_variables(self, model, data):
        """
        These are dummy prepared food variables.
        10 multiple of these will denote the actual prepared food amount
        """
        self.dummy = model.addVars(data['non sold hours'] + data["hours"], data["dishes"], vtype = GRB.INTEGER, lb = 0)

    def create_used_variables(self, model, data):
        """
        These variables denote the amount of food that is being prepared in the current hour
        that will be used in some future hour for each dish
        """
        self.used = {}
        for ix, hour in enumerate(data['non sold hours'] + data["hours"]):
            self.used[hour] = model.addVars((data['non sold hours'] + data["hours"])[ix:], data["dishes"], vtype = GRB.INTEGER, lb = 0)
    
    def create_unfilled_demand_variables(self, model, data):
        """
        These variables denote the amount of unfulfilled part the requirement 
        of the current hour for each particular dish
        """
        self.unfilled_demand = model.addVars(data['hours'], data["dishes"], vtype = GRB.INTEGER, lb = 0)

    def create_wasted_variables(self, model, data):
        """
        These variables denote the amount of food that is being wasted for each particular hour
        """
        self.wasted = model.addVars(data['non sold hours'] + data['hours'], data['dishes'], vtype = GRB.INTEGER, lb = 0)