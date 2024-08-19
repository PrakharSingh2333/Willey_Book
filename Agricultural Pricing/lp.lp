\ Model Pricing
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
 [ 2 demand_of_product[Milk] * price_of_product[Milk]
   + 2 demand_of_product[Butter] * price_of_product[Butter]
   + 2 demand_of_product[Cheese_1] * price_of_product[Cheese_1]
   + 2 demand_of_product[Cheese_2] * price_of_product[Cheese_2] ] / 2 
Subject To
 capacity_constraint[Fat]: 0.04 demand_of_product[Milk]
   + 0.8 demand_of_product[Butter] + 0.35 demand_of_product[Cheese_1]
   + 0.25 demand_of_product[Cheese_2] <= 600
 capacity_constraint[Dry_matter]: 0.09 demand_of_product[Milk]
   + 0.02 demand_of_product[Butter] + 0.3 demand_of_product[Cheese_1]
   + 0.4 demand_of_product[Cheese_2] <= 750
 price_constraint: 4.82 price_of_product[Milk]
   + 0.32 price_of_product[Butter] + 0.21 price_of_product[Cheese_1]
   + 0.07 price_of_product[Cheese_2] <= 1.939
 elasticity_constraint_for_Milk:
   - 0.2074688796680498 demand_of_product[Milk]
   - 1.346801346801347 price_of_product[Milk] = -1.4
 elasticity_constraint_for_Butter: - 3.125 demand_of_product[Butter]
   - 3.75 price_of_product[Butter] = -3.7
 elasticity_constraint_for_Cheese_1:
   - 4.761904761904762 demand_of_product[Cheese_1]
   - 1.047619047619048 price_of_product[Cheese_1]
   + 0.1226993865030675 price_of_product[Cheese_2] = -2
 elasticity_constraint_for_Cheese_2:
   - 14.28571428571428 demand_of_product[Cheese_2]
   + 0.3809523809523809 price_of_product[Cheese_1]
   - 0.49079754601227 price_of_product[Cheese_2] = -1
Bounds
End
