import pandas as pd
import os 
curr_path  = os.getcwd() 
def read_file():
    params = {}
    input =  pd.read_excel(curr_path+'/input.xlsx')
    input.set_index('Unnamed: 0',inplace=True)
    params['input'] = input
    params['Prod'] = input.index
    params['Content'] = input.columns[:2]
    params['Consumption'] = dict(zip(params['Prod'],[4.82,0.32,0.21,0.07]))
    params['Previous_Price'] = dict(zip(params['Prod'],[0.297,0.720,1.05,0.815]))
    params['Elasticity'] = dict(zip(params['Prod'],[0.4,2.7,1.1,0.4]))
    params['Capacity'] = dict(zip(params['Content'],[600,750]))
    return params

