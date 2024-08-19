\ Model DepotModel
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  Customer_from_depot_or_factory[C1,Liverpool]
   + 2 Customer_from_depot_or_factory[C1,Brighton]
   + Customer_from_depot_or_factory[C1,Birmingham]
   + 1.2 Customer_from_depot_or_factory[C1,Bristol]
   + 1.5 Customer_from_depot_or_factory[C2,Newcastle]
   + 0.5 Customer_from_depot_or_factory[C2,Birmingham]
   + 1.5 Customer_from_depot_or_factory[C2,London]
   + 0.6 Customer_from_depot_or_factory[C2,Bristol]
   + 0.4 Customer_from_depot_or_factory[C2,Northampton]
   + 1.5 Customer_from_depot_or_factory[C3,Liverpool]
   + 0.5 Customer_from_depot_or_factory[C3,Newcastle]
   + 0.5 Customer_from_depot_or_factory[C3,Birmingham]
   + 2 Customer_from_depot_or_factory[C3,London]
   + 0.2 Customer_from_depot_or_factory[C3,Exeter]
   + 0.5 Customer_from_depot_or_factory[C3,Bristol]
   + 2 Customer_from_depot_or_factory[C4,Liverpool]
   + 1.5 Customer_from_depot_or_factory[C4,Newcastle]
   + Customer_from_depot_or_factory[C4,Birmingham]
   + 1.5 Customer_from_depot_or_factory[C4,Exeter]
   + 0.5 Customer_from_depot_or_factory[C4,Northampton]
   + 0.5 Customer_from_depot_or_factory[C5,Birmingham]
   + 0.5 Customer_from_depot_or_factory[C5,London]
   + 0.5 Customer_from_depot_or_factory[C5,Exeter]
   + 0.3 Customer_from_depot_or_factory[C5,Bristol]
   + 0.6 Customer_from_depot_or_factory[C5,Northampton]
   + Customer_from_depot_or_factory[C6,Liverpool]
   + Customer_from_depot_or_factory[C6,Newcastle]
   + 1.5 Customer_from_depot_or_factory[C6,London]
   + 1.5 Customer_from_depot_or_factory[C6,Exeter]
   + 0.8 Customer_from_depot_or_factory[C6,Bristol]
   + 0.9 Customer_from_depot_or_factory[C6,Northampton]
   + 0.5 Depot_from_factory[Newcastle,Liverpool]
   + 0.5 Depot_from_factory[Birmingham,Liverpool]
   + 0.3 Depot_from_factory[Birmingham,Brighton]
   + Depot_from_factory[London,Liverpool]
   + 0.5 Depot_from_factory[London,Brighton]
   + 0.2 Depot_from_factory[Exeter,Liverpool]
   + 0.2 Depot_from_factory[Exeter,Brighton]
   + 0.6 Depot_from_factory[Bristol,Liverpool]
   + 0.4 Depot_from_factory[Bristol,Brighton]
   + 0.4 Depot_from_factory[Northampton,Liverpool]
   + 0.3 Depot_from_factory[Northampton,Brighton]
   + 10000 active_depot[Newcastle] + 3000 active_depot[Birmingham]
   + 0 active_depot[London] + 5000 active_depot[Exeter]
   + 12000 active_depot[Bristol] + 4000 active_depot[Northampton]
   - 15000 Constant
Subject To
 Demand_Constraint[C1]: Customer_from_depot_or_factory[C1,Liverpool]
   + Customer_from_depot_or_factory[C1,Brighton]
   + Customer_from_depot_or_factory[C1,Birmingham]
   + Customer_from_depot_or_factory[C1,Bristol] >= 50000
 Demand_Constraint[C2]: Customer_from_depot_or_factory[C2,Newcastle]
   + Customer_from_depot_or_factory[C2,Birmingham]
   + Customer_from_depot_or_factory[C2,London]
   + Customer_from_depot_or_factory[C2,Bristol]
   + Customer_from_depot_or_factory[C2,Northampton] >= 10000
 Demand_Constraint[C3]: Customer_from_depot_or_factory[C3,Liverpool]
   + Customer_from_depot_or_factory[C3,Newcastle]
   + Customer_from_depot_or_factory[C3,Birmingham]
   + Customer_from_depot_or_factory[C3,London]
   + Customer_from_depot_or_factory[C3,Exeter]
   + Customer_from_depot_or_factory[C3,Bristol] >= 40000
 Demand_Constraint[C4]: Customer_from_depot_or_factory[C4,Liverpool]
   + Customer_from_depot_or_factory[C4,Newcastle]
   + Customer_from_depot_or_factory[C4,Birmingham]
   + Customer_from_depot_or_factory[C4,Exeter]
   + Customer_from_depot_or_factory[C4,Northampton] >= 35000
 Demand_Constraint[C5]: Customer_from_depot_or_factory[C5,Birmingham]
   + Customer_from_depot_or_factory[C5,London]
   + Customer_from_depot_or_factory[C5,Exeter]
   + Customer_from_depot_or_factory[C5,Bristol]
   + Customer_from_depot_or_factory[C5,Northampton] >= 60000
 Demand_Constraint[C6]: Customer_from_depot_or_factory[C6,Liverpool]
   + Customer_from_depot_or_factory[C6,Newcastle]
   + Customer_from_depot_or_factory[C6,London]
   + Customer_from_depot_or_factory[C6,Exeter]
   + Customer_from_depot_or_factory[C6,Bristol]
   + Customer_from_depot_or_factory[C6,Northampton] >= 20000
 Capacity_constraint__factory[Liverpool]:
   Customer_from_depot_or_factory[C1,Liverpool]
   + Customer_from_depot_or_factory[C3,Liverpool]
   + Customer_from_depot_or_factory[C4,Liverpool]
   + Customer_from_depot_or_factory[C6,Liverpool]
   + Depot_from_factory[Newcastle,Liverpool]
   + Depot_from_factory[Birmingham,Liverpool]
   + Depot_from_factory[London,Liverpool]
   + Depot_from_factory[Exeter,Liverpool]
   + Depot_from_factory[Bristol,Liverpool]
   + Depot_from_factory[Northampton,Liverpool] <= 1.5e+06
 Capacity_constraint__factory[Brighton]:
   Customer_from_depot_or_factory[C1,Brighton]
   + Depot_from_factory[Birmingham,Brighton]
   + Depot_from_factory[London,Brighton]
   + Depot_from_factory[Exeter,Brighton]
   + Depot_from_factory[Bristol,Brighton]
   + Depot_from_factory[Northampton,Brighton] <= 200000
 Capacity_constraint__New_depot[Exeter]:
   Depot_from_factory[Exeter,Liverpool]
   + Depot_from_factory[Exeter,Brighton] - 40000 active_depot[Exeter] <= 0
 Capacity_constraint__New_depot[Bristol]:
   Depot_from_factory[Bristol,Liverpool]
   + Depot_from_factory[Bristol,Brighton] - 30000 active_depot[Bristol]
   <= 0
 Capacity_constraint__New_depot[Northampton]:
   Depot_from_factory[Northampton,Liverpool]
   + Depot_from_factory[Northampton,Brighton]
   - 25000 active_depot[Northampton] <= 0
 Capacity_constraint__New_depot[Newcastle]:
   Depot_from_factory[Newcastle,Liverpool] - 70000 active_depot[Newcastle]
   <= 0
 Flow_balance_constraint_depot[Newcastle]:
   Customer_from_depot_or_factory[C2,Newcastle]
   + Customer_from_depot_or_factory[C3,Newcastle]
   + Customer_from_depot_or_factory[C4,Newcastle]
   + Customer_from_depot_or_factory[C6,Newcastle]
   - Depot_from_factory[Newcastle,Liverpool] = 0
 Flow_balance_constraint_depot[Birmingham]:
   Customer_from_depot_or_factory[C1,Birmingham]
   + Customer_from_depot_or_factory[C2,Birmingham]
   + Customer_from_depot_or_factory[C3,Birmingham]
   + Customer_from_depot_or_factory[C4,Birmingham]
   + Customer_from_depot_or_factory[C5,Birmingham]
   - Depot_from_factory[Birmingham,Liverpool]
   - Depot_from_factory[Birmingham,Brighton] = 0
 Flow_balance_constraint_depot[London]:
   Customer_from_depot_or_factory[C2,London]
   + Customer_from_depot_or_factory[C3,London]
   + Customer_from_depot_or_factory[C5,London]
   + Customer_from_depot_or_factory[C6,London]
   - Depot_from_factory[London,Liverpool]
   - Depot_from_factory[London,Brighton] = 0
 Flow_balance_constraint_depot[Exeter]:
   Customer_from_depot_or_factory[C3,Exeter]
   + Customer_from_depot_or_factory[C4,Exeter]
   + Customer_from_depot_or_factory[C5,Exeter]
   + Customer_from_depot_or_factory[C6,Exeter]
   - Depot_from_factory[Exeter,Liverpool]
   - Depot_from_factory[Exeter,Brighton] = 0
 Flow_balance_constraint_depot[Bristol]:
   Customer_from_depot_or_factory[C1,Bristol]
   + Customer_from_depot_or_factory[C2,Bristol]
   + Customer_from_depot_or_factory[C3,Bristol]
   + Customer_from_depot_or_factory[C5,Bristol]
   + Customer_from_depot_or_factory[C6,Bristol]
   - Depot_from_factory[Bristol,Liverpool]
   - Depot_from_factory[Bristol,Brighton] = 0
 Flow_balance_constraint_depot[Northampton]:
   Customer_from_depot_or_factory[C2,Northampton]
   + Customer_from_depot_or_factory[C4,Northampton]
   + Customer_from_depot_or_factory[C5,Northampton]
   + Customer_from_depot_or_factory[C6,Northampton]
   - Depot_from_factory[Northampton,Liverpool]
   - Depot_from_factory[Northampton,Brighton] = 0
 active_depot_constraint: active_depot[Newcastle] + active_depot[Exeter]
   + active_depot[Bristol] + active_depot[Northampton] <= 2
 expansion_constraint: Depot_from_factory[Birmingham,Liverpool]
   + Depot_from_factory[Birmingham,Brighton]
   - 20000 active_depot[Birmingham] <= 50000
Bounds
 Constant = 1
Binaries
 active_depot[Newcastle] active_depot[Birmingham] active_depot[London]
 active_depot[Exeter] active_depot[Bristol] active_depot[Northampton]
End
