import os
import pandas as pd 
import itertools as it 
def read_file():
    params = {}
    current_path =  os.getcwd()
    input =  pd.read_excel(current_path+'/Input.xlsx')
    params['Mines'] = input['Unnamed: 0']
    params['Quality'] = dict(zip(params['Mines'],input['quality']))
    params['Royalties'] = dict(zip(params['Mines'],input['Royalties']))
    params['Upper_Limit']   =  dict(zip(params['Mines'],input['Upper_Limit']))
    params['Years'] = list(range(1,6))
    params['blend_target'] = dict(zip(params['Years'],[0.9,0.8,1.2,0.6,1]))
    params['price'] = 10
    params['year_disc'] = {year : 1/(1+0.1)**(year-1) for year in params['Years'] }   
    return params