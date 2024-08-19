import pandas as pd  
import os 
curr_path =  os.getcwd()
def read_file():
    params = {}
    input  =  pd.read_excel(curr_path + "/Input.xlsx")
    input.set_index("Unnamed: 0", inplace = True)
    input.fillna(0, inplace = True)
    input.replace('-' ,0,inplace = True)
    params['input'] = input
    params['column'] = input.columns
    params['Customers'] = input.index[-6:]
    params['Depot'] =  input.columns[2:]
    params['New_Depot'] = input.columns[-3:].to_list()+['Newcastle']
    params['Capacity'] =  dict(zip(params['column'],[1500000,200000,70000,50000,100000,40000,30000,25000]))
    params['Demand'] =  dict(zip(params['Customers'],[50000, 10000, 40000, 35000, 60000, 20000]))
    params['Factory'] = input.columns[:2]
    return params 