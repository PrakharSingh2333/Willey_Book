import pandas as pd
import numpy as np

class input:
    def read_input(self):
        """
        This function reads the input from the input data excel sheets
        """
        # Read data from excel
        df_demand = pd.read_excel("./data/requirement.xlsx").T
        col = df_demand.iloc[0]
        df_demand = df_demand[1:]
        df_demand.columns = col
        df_metrics = pd.read_excel("./data/foodconsumption.xlsx", index_col= 0).astype(np.int64)
        
        # Convert the dataframe into a a data dictionary
        data = {}
        data['requirement'] = df_demand
        data['metrics'] = df_metrics
        data['hours'] = df_demand.index.to_list()
        data['non sold hours'] = list(range(0,data['hours'][0]))
        data['dishes'] = df_metrics.index.to_list()
        return data