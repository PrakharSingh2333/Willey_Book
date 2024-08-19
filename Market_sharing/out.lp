\ Model Market_Shares
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  0 retailer_B_pos_deviation + 0 retailer_B_neg_deviation
Subject To
 allocation_constraint_delivery_points: 11 allocation[M1]
   + 47 allocation[M2] + 44 allocation[M3] + 25 allocation[M4]
   + 26 allocation[M5] + 54 allocation[M6] + 18 allocation[M7]
   + 58 allocation[M8] + 14 allocation[M9] + 51 allocation[M10]
   + 20 allocation[M11] + 7 allocation[M12] + 16 allocation[M13]
   + 20 allocation[M14] + 25 allocation[M15] + 30 allocation[M16]
   + 50 allocation[M17] + 21 allocation[M18] + 11 allocation[M19]
   + 19 allocation[M20] + 14 allocation[M21] + 10 allocation[M22]
   + 11 allocation[M23] + delivery_pos_deviation - delivery_neg_deviation
   = 240.8
 allocation_constraint_spirit_market: 34 allocation[M1]
   + 411 allocation[M2] + 82 allocation[M3] + 157 allocation[M4]
   + 183 allocation[M5] + 154 allocation[M6] + 101 allocation[M7]
   + 212 allocation[M8] + 105 allocation[M9] + 202 allocation[M10]
   + 70 allocation[M11] + 55 allocation[M12] + 53 allocation[M13]
   + 108 allocation[M14] + 56 allocation[M15] + 103 allocation[M16]
   + 535 allocation[M17] + 8 allocation[M18] + 53 allocation[M19]
   + 28 allocation[M20] + 69 allocation[M21] + 65 allocation[M22]
   + 27 allocation[M23] - spirit_neg_deviation + spirit_pos_deviation
   = 1148.4
 allocation_constraint_oil_market_region1: 9 allocation[M1]
   + 13 allocation[M2] + 14 allocation[M3] + 17 allocation[M4]
   + 16 allocation[M5] + 18 allocation[M6] - oil_neg_deviation
   + oil_pos_deviation = 34.8
 allocation_constraint_oil_market_region2: 9 allocation[M7]
   + 11 allocation[M8] + 9 allocation[M9] + 21 allocation[M10]
   + 15 allocation[M11] + 18 allocation[M12] + 17 allocation[M13]
   - oil2_neg_deviation + oil2_pos_deviation = 40
 allocation_constraint_oil_market_region3: 19 allocation[M14]
   + 22 allocation[M15] + 24 allocation[M16] + 36 allocation[M17]
   + 43 allocation[M18] + 6 allocation[M19] + 15 allocation[M20]
   + 15 allocation[M21] + 25 allocation[M22] + 39 allocation[M23]
   + oil3_pos_deviation - oil3_neg_deviation = 97.6
 allocation_constraint_retailers_A: allocation[M1] + allocation[M2]
   + allocation[M3] + allocation[M4] + allocation[M5] + allocation[M20]
   + retailer_A_pos_deviation - retailer_A_neg_deviation = 2.4
Bounds
 delivery_pos_deviation <= 30.1
 delivery_neg_deviation <= 30.1
 spirit_neg_deviation <= 143.55
 spirit_pos_deviation <= 143.55
 oil_neg_deviation <= 4.35
 oil_pos_deviation <= 4.35
 oil2_neg_deviation <= 5
 oil2_pos_deviation <= 5
 oil3_pos_deviation <= 12.2
 oil3_neg_deviation <= 12.2
 retailer_A_pos_deviation <= 0.3
 retailer_A_neg_deviation <= 0.3
 retailer_B_pos_deviation <= 0.85
 retailer_B_neg_deviation <= 0.85
Binaries
 allocation[M1] allocation[M2] allocation[M3] allocation[M4] allocation[M5]
 allocation[M6] allocation[M7] allocation[M8] allocation[M9]
 allocation[M10] allocation[M11] allocation[M12] allocation[M13]
 allocation[M14] allocation[M15] allocation[M16] allocation[M17]
 allocation[M18] allocation[M19] allocation[M20] allocation[M21]
 allocation[M22] allocation[M23]
End
