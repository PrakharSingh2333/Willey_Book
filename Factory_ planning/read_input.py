def read_file():
    """set of parameters"""
    params = {}
    params['Month'] =  ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
    params['Product'] = ['Prod1', 'Prod2', 'Prod3', 'Prod4', 'Prod5', 'Prod6']
    params['machine'] = ['grinder','vertical_drill','horizontal_drill','borer','planner']
    # NO and typpe of machine down for particular month
    params["down_time"] = {('Jan','grinder'):1,('Feb','horizontal_drill'):2,('Mar','borer'):1,('Apr','vertical_drill'):1,('May','grinder'):1,('May','vertical_drill'):1,('Jun','planner'):1,('Jun','horizontal_drill'):1}
    params['profit'] =  dict(zip(params['Product'],[10,6,8,4,11,9,3]))
    params["time_req"] = {
        "grinder": {    "Prod1": 0.5, "Prod2": 0.7, "Prod5": 0.3,
                        "Prod6": 0.2, "Prod7": 0.5 },
        "vertical_drill": {  "Prod1": 0.1, "Prod2": 0.2, "Prod4": 0.3,
                        "Prod6": 0.6 },
        "horizontal_drill": {  "Prod1": 0.2, "Prod3": 0.8, "Prod7": 0.6 },
        "borer": {      "Prod1": 0.05,"Prod2": 0.03,"Prod4": 0.07,
                        "Prod5": 0.1, "Prod7": 0.08 },
        "planner": {     "Prod3": 0.01,"Prod5": 0.05,"Prod7": 0.05 }
    }
    params['installed_machine'] = {'grinder':4,'vertical_drill':2,'horizontal_drill':3,'borer':1,'planner':1}
    params ['store_goal'] =  50
    params ['data'] = [500,1000,300,300,800,200,100,600,500,200,0, 400,300,150,300,600,0,0,500,400,100,200,300,400,500,200,0,100,0,100,500,100,1000, 300, 0,500, 500,100, 300, 1100, 500, 60]
    params ['max_sales'] =  dict(zip(it.product(params['Month'] , params['Product']),params ['data']))
    params['holding_cost'] = 0.5
    params['max_inventory'] = 100

    params['hours_per_month'] = 2*8*24
    
    
    return params