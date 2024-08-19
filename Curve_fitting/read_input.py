import pandas as pd
import os
def read_file():
    curr_path  =  os.getcwd()
    input = pd.read_excel(curr_path+'/data.xlsx') 
    input.index+=1
    return input 

