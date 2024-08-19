# import pandas as pd
# import os 
# import itertools as it
# def read_file():
#     params = {}
#     current_path =  os.getcwd()
#     input =  pd.read_excel(current_path+'/Book1.xlsx',index_col=None)
#     params['distil_material'] = list(input.columns[1:-1])
#     data  =  input.iloc[:, 1:-1].values
#     data = list(it.chain(*data))
#     params['raw_material'] = list(input['Unnamed: 0'])
#     params['distil_coff'] = dict(zip((it.product(params['raw_material'],params['distil_material'])),data))
    
   
#     params.distil_coff = dict(zip((it.product(params.distil_material,params.raw_material)),input.values))
#     params.napthas = list(input.columns[1:4])
#     params.oils =  list(input.columns[4:6])
#     params.cracking_products_names = ["Cracked_gasoline", "Cracked_oil"]
#     params.used_for_motor_fuel_names = ["Light_naphtha", "Medium_naphtha", "Heavy_naphtha",
#                                 "Reformed_gasoline", "Cracked_gasoline"]
#     params.used_for_jet_fuel_names = ["Light_oil", "Heavy_oil", "Residuum", "Cracked_oil"]
#     params.buy_limit=  dict(zip(params.raw_material,input['Buy_limit'])) #input['Buy_limit']
#     params.distil_cap = 45000
#     params.reform_cap = 10000
#     params.cracked_oil_cap = 8000
#     params.lu_min = 500
#     params.lu_max = 1000
#     params.final_prod  = ["Premium_fuel", "Regular_fuel", "Jet_fuel", "Fuel_oil", "Lube_oil"]
#     params.reform_coff = dict(zip(params.napthas,[0.6,0.52,0.45]))
#     params.crackin_coff = dict(zip((it.product(params.oils,params.cracking_products_names)),[0.28,0.68,0.2,0.75]))
#     params.lube_oil_factor = 0.5
#     params.pmf_rmf_ratio = 0.4
#     params['blending_coff'] = dict(zip(params['used_for_jet_fuel_names'],[0.55,0.17,0.055,0.22]))
#     params.octane_no = dict(zip(params.used_for_motor_fuel_names,[90,80,70,115,105]))
#     params.octance_number_fuel = {"Premium_fuel": 94,"Regular_fuel": 84}
#     params.vapour_cof = dict(zip(params.used_for_jet_fuel_names,[1,0.6,0.05,1.5]))
#     params.profit =  dict(zip(params.final_prod,[700,600,400,350,150]))
#     return params
# read_file()

import os
import pandas as pd
import itertools as it
def read_file():
    params = {}
    current_path =  os.getcwd()
    input_data =  pd.read_excel(current_path+'/Book1.xlsx', index_col=None)

    params['distil_material'] = list(input_data.columns[1:-1])
    data = input_data.iloc[:, 1:-1].values
    data = list(it.chain(*data))
    params['raw_material'] = list(input_data['Unnamed: 0'])
    params['distil_coff'] = dict(zip(it.product(params['raw_material'], params['distil_material']), data))
    print(params['distil_coff'])
    params['napthas'] = list(input_data.columns[1:4])
    params['oils'] = list(input_data.columns[4:6])
    params['cracking_products_names'] = ["Cracked_gasoline", "Cracked_oil"]
    params['used_for_motor_fuel_names'] = ["Light_naphtha", "Medium_naphtha", "Heavy_naphtha", "Reformed_gasoline", "Cracked_gasoline"]
    params['used_for_jet_fuel_names'] = ["Light_oil", "Heavy_oil", "Residuum", "Cracked_oil"]
    params['buy_limit'] = dict(zip(params['raw_material'], input_data['Buy_limit'])) # input_data['Buy_limit']
    params['distil_cap'] = 45000
    params['reform_cap'] = 10000
    params['cracked_oil_cap'] = 8000
    params['lu_min'] = 500
    params['lu_max'] = 1000
    params['final_prod'] = ["Premium_fuel", "Regular_fuel", "Jet_fuel", "Fuel_oil", "Lube_oil"]
    params['reform_coff'] = dict(zip(params['napthas'], [0.6, 0.52, 0.45]))
    params['cracking_coff'] = dict(zip(it.product(params['oils'], params['cracking_products_names']), [0.28, 0.68, 0.2, 0.75]))
    params['lube_oil_factor'] = 0.5
    params['pmf_rmf_ratio'] = 0.4
    params['blending_coff'] = dict(zip(params['used_for_jet_fuel_names'], [0.55, 0.17, 0.055, 0.22]))
    params['octane_no'] = dict(zip(params['used_for_motor_fuel_names'], [90, 80, 70, 115, 105]))
    params['octane_number_fuel'] = {"Premium_fuel": 94, "Regular_fuel": 84}
    params['vapour_coff'] = dict(zip(params['used_for_jet_fuel_names'], [1, 0.6, 0.05, 1.5]))
    params['profit'] = dict(zip(params['final_prod'], [7, 6, 4, 3.5, 1.5]))
    
    return params
read_file()