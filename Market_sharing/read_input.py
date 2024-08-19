import pandas as pd
import os
curr_path = os.getcwd()
def read_file():
    params ={}
    input = pd.read_excel(curr_path+'/input1.xlsx')

    return input
# params['Retailers'] = input['Retailer'].to_list() 


