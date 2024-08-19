import gurobipy as py
from gurobipy import GRB
import os
import pandas as pd 
import itertools as it
import numpy as np

def read_file():
    curr_path =  os.getcwd()   
    params = {}
    input_file_relocation = pd.read_excel(curr_path + '/Input.xlsx',sheet_name= 'Sheet1')
    params['City'] = input_file_relocation['Location'].to_list()
    params['Department'] = input_file_relocation.columns[1:].to_list()
    data_input  =  input_file_relocation.values[:,1:]
    data =  list(it.chain(*data_input))
    params['Relocation_benifit'] =  dict(zip(it.product(params['City'],params['Department']),data))
    comm_department_qty = pd.read_excel(curr_path + '/Input.xlsx',sheet_name= 'Sheet2')
    comm_department_qty.set_index('Department',inplace = True)
    department_comm = {}
    for idx in comm_department_qty.index:
        non_zero_col = comm_department_qty.columns[comm_department_qty.loc[idx]>=0].tolist()
        department_comm[idx] = non_zero_col
    params['depart_comm'] = department_comm
    comm_city_travel_cost = pd.read_excel(curr_path + '/Input.xlsx',sheet_name= 'Sheet3')
    comm_city_travel_cost.set_index('Location',inplace = True)
    params['comm_city_travel_cost'] = comm_city_travel_cost
    params['comm_department_qty'] = comm_department_qty
    comm_pair =  [(i,j,k,l) for i in params['Department'] for j in params['City'] for k in params['Department'] for l in params['City'] if comm_department_qty.loc[i,k]>=0 and comm_city_travel_cost.loc[j,l]>=0 ]
    params['comm_pair'] = comm_pair
     
    return params
