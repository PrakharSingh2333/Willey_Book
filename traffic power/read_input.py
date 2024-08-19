import pandas as pd

def read_file():
    params ={}
    params['Time_period'] = 5
    params['gen_no'] = 3
    params['Num_gentype'] = [12,10,5]
    params['demand'] = [15000,30000,25000,40000,27000]
    params['Min_gen_type'] = [850,1250,1500]
    params['Max_gen_type'] = [2000,1750,4000]
    params['Min_cost_per_hour'] [1000,2600,3000]
    params['cost_above_minimum_per_hour'] = [2,1.30,3]
    params['start_cost_ngen'] = [2000,1000,500]
    return params