\ Model Market_Shares
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  delivery_pos_deviation + delivery_neg_deviation + spirit_neg_deviation
   + spirit_pos_deviation + oil_neg_deviation + oil_pos_deviation
   + oil2_neg_deviation + oil2_pos_deviation + oil3_pos_deviation
   + oil3_neg_deviation + retailer_A_pos_deviation
   + retailer_A_neg_deviation + retailer_B_pos_deviation
   + retailer_B_neg_deviation
Subject To
 allocation_constraint_delivery_points: 11 allocation[M1]
   + 47 allocation[M2] + 44 allocation[M3] + 25 allocation[M4]
   + 10 allocation[M5] + 26 allocation[M6] + 26 allocation[M7]
   + 54 allocation[M8] + 18 allocation[M9] + 51 allocation[M10]
   + 20 allocation[M11] + 105 allocation[M12] + 7 allocation[M13]
   + 16 allocation[M14] + 34 allocation[M15] + 100 allocation[M16]
   + 50 allocation[M17] + 21 allocation[M18] + 11 allocation[M19]
   + 19 allocation[M20] + 14 allocation[M21] + 10 allocation[M22]
   + 11 allocation[M23] + delivery_pos_deviation - delivery_neg_deviation
   = 292
 allocation_constraint_spirit_market: 34 allocation[M1]
   + 411 allocation[M2] + 82 allocation[M3] + 157 allocation[M4]
   + 5 allocation[M5] + 183 allocation[M6] + 14 allocation[M7]
   + 215 allocation[M8] + 102 allocation[M9] + 21 allocation[M10]
   + 54 allocation[M11] + 6 allocation[M13] + 96 allocation[M14]
   + 118 allocation[M15] + 112 allocation[M16] + 535 allocation[M17]
   + 8 allocation[M18] + 53 allocation[M19] + 28 allocation[M20]
   + 69 allocation[M21] + 65 allocation[M22] + 27 allocation[M23]
   - spirit_neg_deviation + spirit_pos_deviation = 958
 allocation_constraint_oil_market_region1: 9 allocation[M1]
   + 13 allocation[M2] + 14 allocation[M3] + 17 allocation[M4]
   + 18 allocation[M5] + 19 allocation[M6] + 23 allocation[M7]
   + 21 allocation[M8] - oil_neg_deviation + oil_pos_deviation = 53.6
 allocation_constraint_oil_market_region2: 9 allocation[M9]
   + 11 allocation[M10] + 17 allocation[M11] + 18 allocation[M12]
   + 18 allocation[M13] + 17 allocation[M14] + 22 allocation[M15]
   + 24 allocation[M16] + 36 allocation[M17] + 43 allocation[M18]
   - oil2_neg_deviation + oil2_pos_deviation = 86
 allocation_constraint_oil_market_region3: 6 allocation[M19]
   + 15 allocation[M20] + 15 allocation[M21] + 25 allocation[M22]
   + 39 allocation[M23] + oil3_pos_deviation - oil3_neg_deviation = 40
 allocation_constraint_retailers_A: allocation[M1] + allocation[M2]
   + allocation[M3] + allocation[M5] + allocation[M6] + allocation[M10]
   + allocation[M15] + allocation[M20] + retailer_A_pos_deviation
   - retailer_A_neg_deviation = 3.2
 allocation_constraint_retailers_B: allocation[M4] + allocation[M7]
   + allocation[M8] + allocation[M9] + allocation[M11] + allocation[M12]
   + allocation[M13] + allocation[M14] + allocation[M16] + allocation[M17]
   + allocation[M18] + allocation[M19] + allocation[M21] + allocation[M22]
   + allocation[M23] + retailer_B_pos_deviation - retailer_B_neg_deviation
   = 6
Bounds
 delivery_pos_deviation <= 36.5
 delivery_neg_deviation <= 36.5
 spirit_neg_deviation <= 119.75
 spirit_pos_deviation <= 119.75
 oil_neg_deviation <= 6.7
 oil_pos_deviation <= 6.7
 oil2_neg_deviation <= 10.75
 oil2_pos_deviation <= 10.75
 oil3_pos_deviation <= 5
 oil3_neg_deviation <= 5
 retailer_A_pos_deviation <= 0.4
 retailer_A_neg_deviation <= 0.4
 retailer_B_pos_deviation <= 0.75
 retailer_B_neg_deviation <= 0.75
Binaries
 allocation[M1] allocation[M2] allocation[M3] allocation[M4] allocation[M5]
 allocation[M6] allocation[M7] allocation[M8] allocation[M9]
 allocation[M10] allocation[M11] allocation[M12] allocation[M13]
 allocation[M14] allocation[M15] allocation[M16] allocation[M17]
 allocation[M18] allocation[M19] allocation[M20] allocation[M21]
 allocation[M22] allocation[M23]
End
