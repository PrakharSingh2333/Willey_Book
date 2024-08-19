import gurobipy as gp
from gurobipy import GRB
import pandas as pd

class optimizer_flow:
    def __init__(self,params):
        
        """
        Initializes the Restaurant model with the given parameters.
        
        Args:
            params (dict): A dictionary containing the model parameters.
                - 'dishes': List of dishes offered by the restaurant.
                - 'hours': List of hours of operation for the restaurant.
                - 'input_requirement': Input requirements for the restaurant.
                - 'input_cost': Input costs for the restaurant.
                - 'prev_hours': Previous hours of operation for the restaurant.

        Returns:
            None
        """
        
        self.restaurant = gp.Model("Restaurant")
        self.dishes = params['dishes']
        self.hours = params['hours']
        self.input_requirement = params['input_requirement']
        self.input_cost = params['input_cost']
        self.prev_hours =params['prev_hours']
        self.non_sold_hours = params['non sold hours']
    
    
    def build_model(self):
        
        """
        Builds the optimization model by initializing variables, constraints, and the objective function.

        This function calls the following methods to build the model:

        * `self.variable()`: Initializes the variables of the model.
        * `self.demand_constraint()`: Adds the demand constraints to the model.
        * `self.inventory_balance_constraint()`: Adds the inventory balance constraints to the model.
        * `self.objective()`: Defines the objective function of the model.
        * `self.write_model_output_to_csv()`: Writes the model output to a CSV file.

        :return: None
        """
    
        # calling the variable function to intialize the variables
        self.variable()
        
        # calling the constraint function to intialize the constraints
        self.demand_constraint()
        self.waste_food_constraint()
        
        #calling the objective function to finalize the objective of the problem 
        self.objective()
        self.write_model_output_to_excel()
        
        
    
    
    
    def variable(self):
        """
        Variables for the restaurant optimization problem.

        The following variables are defined:

        * `prepare`: The amount of each dish prepared at the start of each hour.
        * `dummy_prepare`: A dummy variable to ensure that the prepared amount is a multiple of 10.
        * `used`: The amount of each dish used from the start of each hour to the end of the planning horizon.
        * `wasted_dish`: The amount of each dish wasted at the start of each hour.
        * `unfullfilled_requirement`: The amount of each dish that cannot be fulfilled at the start of each hour.
        """
        
        # it tells about the amount of dish prepared at a start of hour h 
        self.prepare = self.restaurant.addVars(self.dishes,self.non_sold_hours+self.hours,vtype = GRB.INTEGER,lb =0,name  = 'prepare')
        
         # it tells us about the prepare dish is multiple of 10
        self.dummy_prepare = self.restaurant.addVars(self.dishes,self.non_sold_hours+self.hours,vtype = GRB.INTEGER,lb =0,name  = 'prepare')
        
        self.used = {}
        for i, hour in enumerate(self.non_sold_hours + self.hours):
             self.used[hour] = self.restaurant.addVars((self.non_sold_hours + self.hours)[i:],self.dishes, vtype = GRB.INTEGER, lb = 0)
        # it tells about the amount of dish wasted at start of hour h
        self.wasted_dish = self.restaurant.addVars(self.dishes,self.hours+self.non_sold_hours,vtype = GRB.INTEGER,lb =0,name = 'wasted_dish')
        
        # it tells about the amount of dish unfullfilled requirement at start of hour h
        self.unfullfilled_requirement = self.restaurant.addVars(self.dishes,self.hours,vtype = GRB.INTEGER,lb =0,name = 'unfullfilled_requirement')
        
    
    def demand_constraint(self):
        
        """
        Adds constraints to the optimization problem.

        Constraints:
        1. No sales for the first 5 hours: Ensures that no food is sold during the first 5 hours of operation.
        2. Food usage equals sales: Ensures that the amount of food used from the current hour and previous hours up to the expiration hour equals the sold amount of food.
        3. Preparation quantity is a multiple of 10: Ensures that the amount of each dish prepared at any time is a multiple of 10.

        Parameters:
        None

        Returns:
        None
        """
        # This constraint maintains the fact that for first 5 hours there will not be any sold food
        self.restaurant.addConstrs((gp.quicksum(self.used[hour-k][hour,dish] for k in range(0,min(hour,self.input_cost.loc[dish]['shelf_life(hr)'])))
                                   == 0 for hour in self.non_sold_hours for dish in self.dishes), name = "demand_constraint_1")
        
        #This constraint maintains the fact that the food used from the current hour all the previous hour upto the expiration hour
        #should be equal to the sold amount of food
        self.restaurant.addConstrs((gp.quicksum(self.used[hour-k][hour,dish] for k in range(0,min(hour,self.input_cost.loc[dish]['shelf_life(hr)']))) == 
                                    self.input_requirement.loc[dish][hour] - self.unfullfilled_requirement[dish,hour] for hour in self.hours for dish in self.dishes), name = 'demand_constraint')
        
        
        # Amount of dish prepared at time t should be multiple of 10
        self.restaurant.addConstrs((self.prepare[i,h]== self.dummy_prepare[i,h]*10 for i in self.dishes for h in self.hours+self.non_sold_hours),
                                   name  = "prepare_constraint")
        
        
     
   
    def waste_food_constraint(self):
        """
    Constraint: Food Preparation equals Usage and Waste

    This constraint ensures that the amount of food prepared in a given hour is equal to the sum of:

    1. The amount used in the current hour
    2. The amount used in future hours up to the expiration hour
    3. The amount wasted

    Parameters:
    - hour (int): The current hour
    - dish (str): The type of dish being prepared

    Returns:
    - A constraint object that enforces the above relationship

    Note:
    - The constraint is added for each hour and dish combination
    - The shelf life of the dish is taken into account when calculating the usage in future hours
    """  
       
       
        
        self.restaurant.addConstrs(gp.quicksum(self.used[hour][hour+k,dish]
            for k in range(0,min(self.input_cost.loc[dish]['shelf_life(hr)'],self.hours[-1]- hour))) 
            + self.wasted_dish[dish, hour] == self.prepare[dish,hour] 
            for dish in self.dishes for hour in self.hours+self.non_sold_hours)       
                
              
    def objective(self):
        
        """
        Defines the objective function of the optimization model.

        The objective function is a maximization of the total profit, which is calculated as:

        * The sum of the profit from selling dishes, calculated as the number of dishes sold multiplied by the profit per dish.
        * Minus the sum of the loss from wasting dishes, calculated as the number of dishes wasted multiplied by the loss per dish.
        * Minus the sum of the loss from unfulfilled demand, calculated as the number of unfulfilled demands multiplied by the loss
        per demand.

        The objective function is defined using the `gp.quicksum` function, which calculates the sum of the expression over all dishes 
        and hours.

        After defining the objective function, the `self.restaurant.optimize()` method is called to solve the optimization problem.

        :return: None
    """ 
        
        self.restaurant.setObjective(
            gp.quicksum((self.input_requirement.loc[i][h]*self.input_cost.loc[i]['shelf_life(hr)']
       -self.unfullfilled_requirement[i,h])
       *self.input_cost.loc[i]['Profit(₹)'] for i in self.dishes for h in self.hours)
        -gp.quicksum(self.wasted_dish[i,h]*self.input_cost.loc[i]['Loss_on_wastage₹'] 
                     for i in self.dishes for h in self.hours)
        -gp.quicksum(self.unfullfilled_requirement[i,h]*self.input_cost.loc[i]['Loss_on_demand(₹)'] 
                     for i in self.dishes for h in self.hours),
        GRB.MAXIMIZE)
        
        self.restaurant.optimize()
        
        
   
    def write_model_output_to_excel(self):
        
        """
        Writes the model output to an Excel file.

        This function checks if the model has a solution, and if so, populates a list with the model solution values.
        The list is then converted to a Pandas DataFrame and written to an Excel file.

        The output file contains the following columns:

        * Dish: The name of the dish
        * Hour: The hour of the day
        * demand: The demand for the dish at the given hour
        * inventory: The inventory level of the dish at the given hour
        * prepare: The number of dishes prepared at the given hour
        * sold: The number of dishes sold at the given hour
        * wasted_dish: The number of dishes wasted at the given hour
        * unfullfilled_requirement: The unfulfilled requirement for the dish at the given hour
        
        :return: None
        
        """
       
        output_file = "output_data.xlsx"
       
        if self.restaurant.SolCount == 0:
            print("Model has no solution. Exiting...")
            return
   
   
        outputs = {(dish,hour):{} for hour in self.hours for dish in self.dishes}
        # Populate other columns with model solution values
        for dish in self.dishes:
            for hour in self.hours:
                outputs[( dish,hour)]['sold'] = self.input_requirement.loc[dish][hour] - self.unfullfilled_requirement[dish, hour].x
                outputs[( dish,hour)]['prepared'] = self.prepare[ dish,hour].x
                outputs[( dish,hour)]['demand'] = self.input_requirement.loc[dish][hour]
                outputs[( dish,hour)]['unfilled demand'] = self.unfullfilled_requirement[dish, hour].x
                outputs[( dish,hour)]['inventory_from_previous'] = sum(self.used[hour-k][hour, dish].x                                    for k in range(1, min(hour, self.input_cost.loc[dish]['shelf_life(hr)'])))
                outputs[( dish,hour)]['used_currently'] = self.used[hour][hour, dish].x
                outputs[( dish,hour)]['inventory_for_future'] = sum(self.used[hour][hour + k, dish].x 
                        for k in range(1, min(self.input_cost.loc[dish]['shelf_life(hr)'], self.hours[-1] - hour)))
                outputs[( dish,hour)]['wasted'] = self.wasted_dish[dish, hour].x  
                
           
        
        output_df = pd.DataFrame.from_dict(outputs).T
        with pd.ExcelWriter(output_file, engine='openpyxl') as writer:
          output_df.to_excel(writer, sheet_name='Sheet1')
 
        