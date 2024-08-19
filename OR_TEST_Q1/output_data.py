from gurobipy import GRB
import pandas as pd

class Output:
    def write_output(self, model, vars, data):
        """
        This function write the output into the output_data.xlsx file
        """
        if model.status == GRB.OPTIMAL:
            kpi = pd.DataFrame.from_dict({
                'Optimum Profit' : [model.ObjVal]
            })
            results = {(hour, dish) : {} for hour in data['hours'] for dish in data['dishes']}
            for dish in data['dishes']:
                for hour in data['hours']:
                    results[( hour, dish)]['prepared'] = vars.dummy[hour, dish].x*10
                    results[( hour, dish)]['sold'] = data['requirement'].loc[hour][dish] - vars.unfilled_demand[hour, dish].x
                    results[( hour, dish)]['demand'] = data['requirement'].loc[hour][dish]
                    results[( hour, dish)]['unfilled demand'] = vars.unfilled_demand[hour, dish].x
                    results[( hour, dish)]['inventory_from_previous'] = sum(vars.used[hour-k][hour, dish].x 
                                                                     for k in range(1,min(hour , data['metrics'].loc[dish]['shelf_life'])))
                    results[( hour, dish)]['used_currently'] = vars.used[hour][hour,dish].x
                    results[( hour, dish)]['inventory_for_future'] = sum(vars.used[hour][hour + k, dish].x 
                                                                  for k in range(1, min(data['metrics'].loc[dish]['shelf_life'], data['hours'][-1] - hour)))
                    results[( hour, dish)]['wasted'] = vars.wasted[hour, dish].x
                    
            df = pd.DataFrame.from_dict(results).T
            output_file = "./data/output_data.xlsx"
            with pd.ExcelWriter(output_file) as output:
                df.to_excel(output, sheet_name='results')
                kpi.to_excel(output, index=False, sheet_name='KPI')
            
            
        else:
            print("No optimal solution found!")