import pandas as pd
import os

def read_file():
    curr_path =  os.getcwd()
    params = {}
    input =  pd.read_excel(curr_path+'/input.xlsx') 
    input.set_index('Unnamed: 0', inplace=True)
    input.fillna(0,inplace=True)
    input = input.replace('-',0)
    params['input'] =  input
    params['Customer'] = ['C1', 'C2', 'C3', 'C4', 'C5', 'C6']
    params['Factory'] = ['Liverpool', 'Brighton']
    params['Depot'] = ['Newcastle', 'Birmingham', 'London', 'Exeter']
    params['capacity'] = dict(zip(params['Factory']+params['Depot'], [150000, 200000, 70000, 50000, 100000, 40000]))
    params['Demand'] =  dict(zip(params['Customer'], [50000, 10000, 40000, 35000, 60000, 20000]))
    return params

