\ Model decentralization
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  10000 location_dep_city[A,Bristol] + 10000 location_dep_city[A,Bringhton]
   + 15000 location_dep_city[B,Bristol]
   + 20000 location_dep_city[B,Bringhton]
   + 10000 location_dep_city[C,Bristol]
   + 15000 location_dep_city[C,Bringhton]
   + 20000 location_dep_city[D,Bristol]
   + 15000 location_dep_city[D,Bringhton]
   + 5000 location_dep_city[E,Bristol]
   + 15000 location_dep_city[E,Bringhton]
   - 5000 comm_pair[A,Bristol,C,Bristol]
   - 14000 comm_pair[A,Bristol,C,Bringhton]
   - 13000 comm_pair[A,Bristol,C,London]
   - 7500 comm_pair[A,Bristol,D,Bristol]
   - 21000 comm_pair[A,Bristol,D,Bringhton]
   - 19500 comm_pair[A,Bristol,D,London]
   - 14000 comm_pair[A,Bringhton,C,Bristol]
   - 5000 comm_pair[A,Bringhton,C,Bringhton]
   - 9000 comm_pair[A,Bringhton,C,London]
   - 21000 comm_pair[A,Bringhton,D,Bristol]
   - 7500 comm_pair[A,Bringhton,D,Bringhton]
   - 13500 comm_pair[A,Bringhton,D,London]
   - 13000 comm_pair[A,London,C,Bristol]
   - 9000 comm_pair[A,London,C,Bringhton]
   - 10000 comm_pair[A,London,C,London]
   - 19500 comm_pair[A,London,D,Bristol]
   - 13500 comm_pair[A,London,D,Bringhton]
   - 15000 comm_pair[A,London,D,London]
   - 7000 comm_pair[B,Bristol,C,Bristol]
   - 19600 comm_pair[B,Bristol,C,Bringhton]
   - 18200 comm_pair[B,Bristol,C,London]
   - 6000 comm_pair[B,Bristol,D,Bristol]
   - 16800 comm_pair[B,Bristol,D,Bringhton]
   - 15600 comm_pair[B,Bristol,D,London]
   - 19600 comm_pair[B,Bringhton,C,Bristol]
   - 7000 comm_pair[B,Bringhton,C,Bringhton]
   - 12600 comm_pair[B,Bringhton,C,London]
   - 16800 comm_pair[B,Bringhton,D,Bristol]
   - 6000 comm_pair[B,Bringhton,D,Bringhton]
   - 10800 comm_pair[B,Bringhton,D,London]
   - 18200 comm_pair[B,London,C,Bristol]
   - 12600 comm_pair[B,London,C,Bringhton]
   - 14000 comm_pair[B,London,C,London]
   - 15600 comm_pair[B,London,D,Bristol]
   - 10800 comm_pair[B,London,D,Bringhton]
   - 12000 comm_pair[B,London,D,London]
   - 10000 comm_pair[C,Bristol,E,Bristol]
   - 28000 comm_pair[C,Bristol,E,Bringhton]
   - 26000 comm_pair[C,Bristol,E,London]
   - 28000 comm_pair[C,Bringhton,E,Bristol]
   - 10000 comm_pair[C,Bringhton,E,Bringhton]
   - 18000 comm_pair[C,Bringhton,E,London]
   - 26000 comm_pair[C,London,E,Bristol]
   - 18000 comm_pair[C,London,E,Bringhton]
   - 20000 comm_pair[C,London,E,London]
   - 3500 comm_pair[D,Bristol,E,Bristol]
   - 9800 comm_pair[D,Bristol,E,Bringhton]
   - 9100 comm_pair[D,Bristol,E,London]
   - 9800 comm_pair[D,Bringhton,E,Bristol]
   - 3500 comm_pair[D,Bringhton,E,Bringhton]
   - 6300 comm_pair[D,Bringhton,E,London]
   - 9100 comm_pair[D,London,E,Bristol]
   - 6300 comm_pair[D,London,E,Bringhton]
   - 7000 comm_pair[D,London,E,London]
Subject To
 department_limit[Bristol]: location_dep_city[A,Bristol]
   + location_dep_city[B,Bristol] + location_dep_city[C,Bristol]
   + location_dep_city[D,Bristol] + location_dep_city[E,Bristol] <= 3
 department_limit[Bringhton]: location_dep_city[A,Bringhton]
   + location_dep_city[B,Bringhton] + location_dep_city[C,Bringhton]
   + location_dep_city[D,Bringhton] + location_dep_city[E,Bringhton] <= 3
 department_limit[London]: location_dep_city[A,London]
   + location_dep_city[B,London] + location_dep_city[C,London]
   + location_dep_city[D,London] + location_dep_city[E,London] <= 3
 city_limit[A]: location_dep_city[A,Bristol]
   + location_dep_city[A,Bringhton] + location_dep_city[A,London] = 1
 city_limit[B]: location_dep_city[B,Bristol]
   + location_dep_city[B,Bringhton] + location_dep_city[B,London] = 1
 city_limit[C]: location_dep_city[C,Bristol]
   + location_dep_city[C,Bringhton] + location_dep_city[C,London] = 1
 city_limit[D]: location_dep_city[D,Bristol]
   + location_dep_city[D,Bringhton] + location_dep_city[D,London] = 1
 city_limit[E]: location_dep_city[E,Bristol]
   + location_dep_city[E,Bringhton] + location_dep_city[E,London] = 1
 R8: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,A,Bristol] <= 0
 R9: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,A,Bringhton]
   <= 0
 R10: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,A,London] <= 0
 R11: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,B,Bristol] <= 0
 R12: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,B,Bringhton]
   <= 0
 R13: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,B,London] <= 0
 R14: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,C,Bristol] <= 0
 R15: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,C,Bringhton]
   <= 0
 R16: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,C,London] <= 0
 R17: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,D,Bristol] <= 0
 R18: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,D,Bringhton]
   <= 0
 R19: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,D,London] <= 0
 R20: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,E,Bristol] <= 0
 R21: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,E,Bringhton]
   <= 0
 R22: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,E,London] <= 0
 R23: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,A,Bristol]
   <= 0
 R24: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,A,Bringhton]
   <= 0
 R25: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,A,London]
   <= 0
 R26: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,B,Bristol]
   <= 0
 R27: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,B,Bringhton]
   <= 0
 R28: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,B,London]
   <= 0
 R29: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,C,Bristol]
   <= 0
 R30: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,C,Bringhton]
   <= 0
 R31: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,C,London]
   <= 0
 R32: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,D,Bristol]
   <= 0
 R33: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,D,Bringhton]
   <= 0
 R34: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,D,London]
   <= 0
 R35: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,E,Bristol]
   <= 0
 R36: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,E,Bringhton]
   <= 0
 R37: - location_dep_city[A,Bringhton] + comm_pair[A,Bringhton,E,London]
   <= 0
 R38: - location_dep_city[A,London] + comm_pair[A,London,A,Bristol] <= 0
 R39: - location_dep_city[A,London] + comm_pair[A,London,A,Bringhton] <= 0
 R40: - location_dep_city[A,London] + comm_pair[A,London,A,London] <= 0
 R41: - location_dep_city[A,London] + comm_pair[A,London,B,Bristol] <= 0
 R42: - location_dep_city[A,London] + comm_pair[A,London,B,Bringhton] <= 0
 R43: - location_dep_city[A,London] + comm_pair[A,London,B,London] <= 0
 R44: - location_dep_city[A,London] + comm_pair[A,London,C,Bristol] <= 0
 R45: - location_dep_city[A,London] + comm_pair[A,London,C,Bringhton] <= 0
 R46: - location_dep_city[A,London] + comm_pair[A,London,C,London] <= 0
 R47: - location_dep_city[A,London] + comm_pair[A,London,D,Bristol] <= 0
 R48: - location_dep_city[A,London] + comm_pair[A,London,D,Bringhton] <= 0
 R49: - location_dep_city[A,London] + comm_pair[A,London,D,London] <= 0
 R50: - location_dep_city[A,London] + comm_pair[A,London,E,Bristol] <= 0
 R51: - location_dep_city[A,London] + comm_pair[A,London,E,Bringhton] <= 0
 R52: - location_dep_city[A,London] + comm_pair[A,London,E,London] <= 0
 R53: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,A,Bristol] <= 0
 R54: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,A,Bringhton]
   <= 0
 R55: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,A,London] <= 0
 R56: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,B,Bristol] <= 0
 R57: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,B,Bringhton]
   <= 0
 R58: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,B,London] <= 0
 R59: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,C,Bristol] <= 0
 R60: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,C,Bringhton]
   <= 0
 R61: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,C,London] <= 0
 R62: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,D,Bristol] <= 0
 R63: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,D,Bringhton]
   <= 0
 R64: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,D,London] <= 0
 R65: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,E,Bristol] <= 0
 R66: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,E,Bringhton]
   <= 0
 R67: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,E,London] <= 0
 R68: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,A,Bristol]
   <= 0
 R69: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,A,Bringhton]
   <= 0
 R70: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,A,London]
   <= 0
 R71: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,B,Bristol]
   <= 0
 R72: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,B,Bringhton]
   <= 0
 R73: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,B,London]
   <= 0
 R74: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,C,Bristol]
   <= 0
 R75: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,C,Bringhton]
   <= 0
 R76: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,C,London]
   <= 0
 R77: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,D,Bristol]
   <= 0
 R78: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,D,Bringhton]
   <= 0
 R79: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,D,London]
   <= 0
 R80: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,E,Bristol]
   <= 0
 R81: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,E,Bringhton]
   <= 0
 R82: - location_dep_city[B,Bringhton] + comm_pair[B,Bringhton,E,London]
   <= 0
 R83: - location_dep_city[B,London] + comm_pair[B,London,A,Bristol] <= 0
 R84: - location_dep_city[B,London] + comm_pair[B,London,A,Bringhton] <= 0
 R85: - location_dep_city[B,London] + comm_pair[B,London,A,London] <= 0
 R86: - location_dep_city[B,London] + comm_pair[B,London,B,Bristol] <= 0
 R87: - location_dep_city[B,London] + comm_pair[B,London,B,Bringhton] <= 0
 R88: - location_dep_city[B,London] + comm_pair[B,London,B,London] <= 0
 R89: - location_dep_city[B,London] + comm_pair[B,London,C,Bristol] <= 0
 R90: - location_dep_city[B,London] + comm_pair[B,London,C,Bringhton] <= 0
 R91: - location_dep_city[B,London] + comm_pair[B,London,C,London] <= 0
 R92: - location_dep_city[B,London] + comm_pair[B,London,D,Bristol] <= 0
 R93: - location_dep_city[B,London] + comm_pair[B,London,D,Bringhton] <= 0
 R94: - location_dep_city[B,London] + comm_pair[B,London,D,London] <= 0
 R95: - location_dep_city[B,London] + comm_pair[B,London,E,Bristol] <= 0
 R96: - location_dep_city[B,London] + comm_pair[B,London,E,Bringhton] <= 0
 R97: - location_dep_city[B,London] + comm_pair[B,London,E,London] <= 0
 R98: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,A,Bristol] <= 0
 R99: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,A,Bringhton]
   <= 0
 R100: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,A,London] <= 0
 R101: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,B,Bristol]
   <= 0
 R102: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,B,Bringhton]
   <= 0
 R103: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,B,London] <= 0
 R104: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,C,Bristol]
   <= 0
 R105: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,C,Bringhton]
   <= 0
 R106: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,C,London] <= 0
 R107: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,D,Bristol]
   <= 0
 R108: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,D,Bringhton]
   <= 0
 R109: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,D,London] <= 0
 R110: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,E,Bristol]
   <= 0
 R111: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,E,Bringhton]
   <= 0
 R112: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,E,London] <= 0
 R113: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,A,Bristol]
   <= 0
 R114: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,A,Bringhton] <= 0
 R115: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,A,London]
   <= 0
 R116: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,B,Bristol]
   <= 0
 R117: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,B,Bringhton] <= 0
 R118: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,B,London]
   <= 0
 R119: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,C,Bristol]
   <= 0
 R120: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,C,Bringhton] <= 0
 R121: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,C,London]
   <= 0
 R122: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,D,Bristol]
   <= 0
 R123: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,D,Bringhton] <= 0
 R124: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,D,London]
   <= 0
 R125: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,E,Bristol]
   <= 0
 R126: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,E,Bringhton] <= 0
 R127: - location_dep_city[C,Bringhton] + comm_pair[C,Bringhton,E,London]
   <= 0
 R128: - location_dep_city[C,London] + comm_pair[C,London,A,Bristol] <= 0
 R129: - location_dep_city[C,London] + comm_pair[C,London,A,Bringhton]
   <= 0
 R130: - location_dep_city[C,London] + comm_pair[C,London,A,London] <= 0
 R131: - location_dep_city[C,London] + comm_pair[C,London,B,Bristol] <= 0
 R132: - location_dep_city[C,London] + comm_pair[C,London,B,Bringhton]
   <= 0
 R133: - location_dep_city[C,London] + comm_pair[C,London,B,London] <= 0
 R134: - location_dep_city[C,London] + comm_pair[C,London,C,Bristol] <= 0
 R135: - location_dep_city[C,London] + comm_pair[C,London,C,Bringhton]
   <= 0
 R136: - location_dep_city[C,London] + comm_pair[C,London,C,London] <= 0
 R137: - location_dep_city[C,London] + comm_pair[C,London,D,Bristol] <= 0
 R138: - location_dep_city[C,London] + comm_pair[C,London,D,Bringhton]
   <= 0
 R139: - location_dep_city[C,London] + comm_pair[C,London,D,London] <= 0
 R140: - location_dep_city[C,London] + comm_pair[C,London,E,Bristol] <= 0
 R141: - location_dep_city[C,London] + comm_pair[C,London,E,Bringhton]
   <= 0
 R142: - location_dep_city[C,London] + comm_pair[C,London,E,London] <= 0
 R143: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,A,Bristol]
   <= 0
 R144: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,A,Bringhton]
   <= 0
 R145: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,A,London] <= 0
 R146: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,B,Bristol]
   <= 0
 R147: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,B,Bringhton]
   <= 0
 R148: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,B,London] <= 0
 R149: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,C,Bristol]
   <= 0
 R150: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,C,Bringhton]
   <= 0
 R151: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,C,London] <= 0
 R152: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,D,Bristol]
   <= 0
 R153: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,D,Bringhton]
   <= 0
 R154: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,D,London] <= 0
 R155: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,E,Bristol]
   <= 0
 R156: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,E,Bringhton]
   <= 0
 R157: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,E,London] <= 0
 R158: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,A,Bristol]
   <= 0
 R159: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,A,Bringhton] <= 0
 R160: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,A,London]
   <= 0
 R161: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,B,Bristol]
   <= 0
 R162: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,B,Bringhton] <= 0
 R163: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,B,London]
   <= 0
 R164: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,C,Bristol]
   <= 0
 R165: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,C,Bringhton] <= 0
 R166: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,C,London]
   <= 0
 R167: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,D,Bristol]
   <= 0
 R168: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,D,Bringhton] <= 0
 R169: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,D,London]
   <= 0
 R170: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,E,Bristol]
   <= 0
 R171: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,E,Bringhton] <= 0
 R172: - location_dep_city[D,Bringhton] + comm_pair[D,Bringhton,E,London]
   <= 0
 R173: - location_dep_city[D,London] + comm_pair[D,London,A,Bristol] <= 0
 R174: - location_dep_city[D,London] + comm_pair[D,London,A,Bringhton]
   <= 0
 R175: - location_dep_city[D,London] + comm_pair[D,London,A,London] <= 0
 R176: - location_dep_city[D,London] + comm_pair[D,London,B,Bristol] <= 0
 R177: - location_dep_city[D,London] + comm_pair[D,London,B,Bringhton]
   <= 0
 R178: - location_dep_city[D,London] + comm_pair[D,London,B,London] <= 0
 R179: - location_dep_city[D,London] + comm_pair[D,London,C,Bristol] <= 0
 R180: - location_dep_city[D,London] + comm_pair[D,London,C,Bringhton]
   <= 0
 R181: - location_dep_city[D,London] + comm_pair[D,London,C,London] <= 0
 R182: - location_dep_city[D,London] + comm_pair[D,London,D,Bristol] <= 0
 R183: - location_dep_city[D,London] + comm_pair[D,London,D,Bringhton]
   <= 0
 R184: - location_dep_city[D,London] + comm_pair[D,London,D,London] <= 0
 R185: - location_dep_city[D,London] + comm_pair[D,London,E,Bristol] <= 0
 R186: - location_dep_city[D,London] + comm_pair[D,London,E,Bringhton]
   <= 0
 R187: - location_dep_city[D,London] + comm_pair[D,London,E,London] <= 0
 R188: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,A,Bristol]
   <= 0
 R189: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,A,Bringhton]
   <= 0
 R190: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,A,London] <= 0
 R191: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,B,Bristol]
   <= 0
 R192: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,B,Bringhton]
   <= 0
 R193: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,B,London] <= 0
 R194: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,C,Bristol]
   <= 0
 R195: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,C,Bringhton]
   <= 0
 R196: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,C,London] <= 0
 R197: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,D,Bristol]
   <= 0
 R198: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,D,Bringhton]
   <= 0
 R199: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,D,London] <= 0
 R200: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,E,Bristol]
   <= 0
 R201: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,E,Bringhton]
   <= 0
 R202: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,E,London] <= 0
 R203: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,A,Bristol]
   <= 0
 R204: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,A,Bringhton] <= 0
 R205: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,A,London]
   <= 0
 R206: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,B,Bristol]
   <= 0
 R207: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,B,Bringhton] <= 0
 R208: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,B,London]
   <= 0
 R209: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,C,Bristol]
   <= 0
 R210: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,C,Bringhton] <= 0
 R211: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,C,London]
   <= 0
 R212: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,D,Bristol]
   <= 0
 R213: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,D,Bringhton] <= 0
 R214: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,D,London]
   <= 0
 R215: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,E,Bristol]
   <= 0
 R216: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,E,Bringhton] <= 0
 R217: - location_dep_city[E,Bringhton] + comm_pair[E,Bringhton,E,London]
   <= 0
 R218: - location_dep_city[E,London] + comm_pair[E,London,A,Bristol] <= 0
 R219: - location_dep_city[E,London] + comm_pair[E,London,A,Bringhton]
   <= 0
 R220: - location_dep_city[E,London] + comm_pair[E,London,A,London] <= 0
 R221: - location_dep_city[E,London] + comm_pair[E,London,B,Bristol] <= 0
 R222: - location_dep_city[E,London] + comm_pair[E,London,B,Bringhton]
   <= 0
 R223: - location_dep_city[E,London] + comm_pair[E,London,B,London] <= 0
 R224: - location_dep_city[E,London] + comm_pair[E,London,C,Bristol] <= 0
 R225: - location_dep_city[E,London] + comm_pair[E,London,C,Bringhton]
   <= 0
 R226: - location_dep_city[E,London] + comm_pair[E,London,C,London] <= 0
 R227: - location_dep_city[E,London] + comm_pair[E,London,D,Bristol] <= 0
 R228: - location_dep_city[E,London] + comm_pair[E,London,D,Bringhton]
   <= 0
 R229: - location_dep_city[E,London] + comm_pair[E,London,D,London] <= 0
 R230: - location_dep_city[E,London] + comm_pair[E,London,E,Bristol] <= 0
 R231: - location_dep_city[E,London] + comm_pair[E,London,E,Bringhton]
   <= 0
 R232: - location_dep_city[E,London] + comm_pair[E,London,E,London] <= 0
 R233: - location_dep_city[A,Bristol] + comm_pair[A,Bristol,A,Bristol]
   <= 0
 R234: - location_dep_city[A,Bringhton] + comm_pair[A,Bristol,A,Bringhton]
   <= 0
 R235: - location_dep_city[A,London] + comm_pair[A,Bristol,A,London] <= 0
 R236: - location_dep_city[B,Bristol] + comm_pair[A,Bristol,B,Bristol]
   <= 0
 R237: - location_dep_city[B,Bringhton] + comm_pair[A,Bristol,B,Bringhton]
   <= 0
 R238: - location_dep_city[B,London] + comm_pair[A,Bristol,B,London] <= 0
 R239: - location_dep_city[C,Bristol] + comm_pair[A,Bristol,C,Bristol]
   <= 0
 R240: - location_dep_city[C,Bringhton] + comm_pair[A,Bristol,C,Bringhton]
   <= 0
 R241: - location_dep_city[C,London] + comm_pair[A,Bristol,C,London] <= 0
 R242: - location_dep_city[D,Bristol] + comm_pair[A,Bristol,D,Bristol]
   <= 0
 R243: - location_dep_city[D,Bringhton] + comm_pair[A,Bristol,D,Bringhton]
   <= 0
 R244: - location_dep_city[D,London] + comm_pair[A,Bristol,D,London] <= 0
 R245: - location_dep_city[E,Bristol] + comm_pair[A,Bristol,E,Bristol]
   <= 0
 R246: - location_dep_city[E,Bringhton] + comm_pair[A,Bristol,E,Bringhton]
   <= 0
 R247: - location_dep_city[E,London] + comm_pair[A,Bristol,E,London] <= 0
 R248: - location_dep_city[A,Bristol] + comm_pair[A,Bringhton,A,Bristol]
   <= 0
 R249: - location_dep_city[A,Bringhton]
   + comm_pair[A,Bringhton,A,Bringhton] <= 0
 R250: - location_dep_city[A,London] + comm_pair[A,Bringhton,A,London]
   <= 0
 R251: - location_dep_city[B,Bristol] + comm_pair[A,Bringhton,B,Bristol]
   <= 0
 R252: - location_dep_city[B,Bringhton]
   + comm_pair[A,Bringhton,B,Bringhton] <= 0
 R253: - location_dep_city[B,London] + comm_pair[A,Bringhton,B,London]
   <= 0
 R254: - location_dep_city[C,Bristol] + comm_pair[A,Bringhton,C,Bristol]
   <= 0
 R255: - location_dep_city[C,Bringhton]
   + comm_pair[A,Bringhton,C,Bringhton] <= 0
 R256: - location_dep_city[C,London] + comm_pair[A,Bringhton,C,London]
   <= 0
 R257: - location_dep_city[D,Bristol] + comm_pair[A,Bringhton,D,Bristol]
   <= 0
 R258: - location_dep_city[D,Bringhton]
   + comm_pair[A,Bringhton,D,Bringhton] <= 0
 R259: - location_dep_city[D,London] + comm_pair[A,Bringhton,D,London]
   <= 0
 R260: - location_dep_city[E,Bristol] + comm_pair[A,Bringhton,E,Bristol]
   <= 0
 R261: - location_dep_city[E,Bringhton]
   + comm_pair[A,Bringhton,E,Bringhton] <= 0
 R262: - location_dep_city[E,London] + comm_pair[A,Bringhton,E,London]
   <= 0
 R263: - location_dep_city[A,Bristol] + comm_pair[A,London,A,Bristol] <= 0
 R264: - location_dep_city[A,Bringhton] + comm_pair[A,London,A,Bringhton]
   <= 0
 R265: - location_dep_city[A,London] + comm_pair[A,London,A,London] <= 0
 R266: - location_dep_city[B,Bristol] + comm_pair[A,London,B,Bristol] <= 0
 R267: - location_dep_city[B,Bringhton] + comm_pair[A,London,B,Bringhton]
   <= 0
 R268: - location_dep_city[B,London] + comm_pair[A,London,B,London] <= 0
 R269: - location_dep_city[C,Bristol] + comm_pair[A,London,C,Bristol] <= 0
 R270: - location_dep_city[C,Bringhton] + comm_pair[A,London,C,Bringhton]
   <= 0
 R271: - location_dep_city[C,London] + comm_pair[A,London,C,London] <= 0
 R272: - location_dep_city[D,Bristol] + comm_pair[A,London,D,Bristol] <= 0
 R273: - location_dep_city[D,Bringhton] + comm_pair[A,London,D,Bringhton]
   <= 0
 R274: - location_dep_city[D,London] + comm_pair[A,London,D,London] <= 0
 R275: - location_dep_city[E,Bristol] + comm_pair[A,London,E,Bristol] <= 0
 R276: - location_dep_city[E,Bringhton] + comm_pair[A,London,E,Bringhton]
   <= 0
 R277: - location_dep_city[E,London] + comm_pair[A,London,E,London] <= 0
 R278: - location_dep_city[A,Bristol] + comm_pair[B,Bristol,A,Bristol]
   <= 0
 R279: - location_dep_city[A,Bringhton] + comm_pair[B,Bristol,A,Bringhton]
   <= 0
 R280: - location_dep_city[A,London] + comm_pair[B,Bristol,A,London] <= 0
 R281: - location_dep_city[B,Bristol] + comm_pair[B,Bristol,B,Bristol]
   <= 0
 R282: - location_dep_city[B,Bringhton] + comm_pair[B,Bristol,B,Bringhton]
   <= 0
 R283: - location_dep_city[B,London] + comm_pair[B,Bristol,B,London] <= 0
 R284: - location_dep_city[C,Bristol] + comm_pair[B,Bristol,C,Bristol]
   <= 0
 R285: - location_dep_city[C,Bringhton] + comm_pair[B,Bristol,C,Bringhton]
   <= 0
 R286: - location_dep_city[C,London] + comm_pair[B,Bristol,C,London] <= 0
 R287: - location_dep_city[D,Bristol] + comm_pair[B,Bristol,D,Bristol]
   <= 0
 R288: - location_dep_city[D,Bringhton] + comm_pair[B,Bristol,D,Bringhton]
   <= 0
 R289: - location_dep_city[D,London] + comm_pair[B,Bristol,D,London] <= 0
 R290: - location_dep_city[E,Bristol] + comm_pair[B,Bristol,E,Bristol]
   <= 0
 R291: - location_dep_city[E,Bringhton] + comm_pair[B,Bristol,E,Bringhton]
   <= 0
 R292: - location_dep_city[E,London] + comm_pair[B,Bristol,E,London] <= 0
 R293: - location_dep_city[A,Bristol] + comm_pair[B,Bringhton,A,Bristol]
   <= 0
 R294: - location_dep_city[A,Bringhton]
   + comm_pair[B,Bringhton,A,Bringhton] <= 0
 R295: - location_dep_city[A,London] + comm_pair[B,Bringhton,A,London]
   <= 0
 R296: - location_dep_city[B,Bristol] + comm_pair[B,Bringhton,B,Bristol]
   <= 0
 R297: - location_dep_city[B,Bringhton]
   + comm_pair[B,Bringhton,B,Bringhton] <= 0
 R298: - location_dep_city[B,London] + comm_pair[B,Bringhton,B,London]
   <= 0
 R299: - location_dep_city[C,Bristol] + comm_pair[B,Bringhton,C,Bristol]
   <= 0
 R300: - location_dep_city[C,Bringhton]
   + comm_pair[B,Bringhton,C,Bringhton] <= 0
 R301: - location_dep_city[C,London] + comm_pair[B,Bringhton,C,London]
   <= 0
 R302: - location_dep_city[D,Bristol] + comm_pair[B,Bringhton,D,Bristol]
   <= 0
 R303: - location_dep_city[D,Bringhton]
   + comm_pair[B,Bringhton,D,Bringhton] <= 0
 R304: - location_dep_city[D,London] + comm_pair[B,Bringhton,D,London]
   <= 0
 R305: - location_dep_city[E,Bristol] + comm_pair[B,Bringhton,E,Bristol]
   <= 0
 R306: - location_dep_city[E,Bringhton]
   + comm_pair[B,Bringhton,E,Bringhton] <= 0
 R307: - location_dep_city[E,London] + comm_pair[B,Bringhton,E,London]
   <= 0
 R308: - location_dep_city[A,Bristol] + comm_pair[B,London,A,Bristol] <= 0
 R309: - location_dep_city[A,Bringhton] + comm_pair[B,London,A,Bringhton]
   <= 0
 R310: - location_dep_city[A,London] + comm_pair[B,London,A,London] <= 0
 R311: - location_dep_city[B,Bristol] + comm_pair[B,London,B,Bristol] <= 0
 R312: - location_dep_city[B,Bringhton] + comm_pair[B,London,B,Bringhton]
   <= 0
 R313: - location_dep_city[B,London] + comm_pair[B,London,B,London] <= 0
 R314: - location_dep_city[C,Bristol] + comm_pair[B,London,C,Bristol] <= 0
 R315: - location_dep_city[C,Bringhton] + comm_pair[B,London,C,Bringhton]
   <= 0
 R316: - location_dep_city[C,London] + comm_pair[B,London,C,London] <= 0
 R317: - location_dep_city[D,Bristol] + comm_pair[B,London,D,Bristol] <= 0
 R318: - location_dep_city[D,Bringhton] + comm_pair[B,London,D,Bringhton]
   <= 0
 R319: - location_dep_city[D,London] + comm_pair[B,London,D,London] <= 0
 R320: - location_dep_city[E,Bristol] + comm_pair[B,London,E,Bristol] <= 0
 R321: - location_dep_city[E,Bringhton] + comm_pair[B,London,E,Bringhton]
   <= 0
 R322: - location_dep_city[E,London] + comm_pair[B,London,E,London] <= 0
 R323: - location_dep_city[A,Bristol] + comm_pair[C,Bristol,A,Bristol]
   <= 0
 R324: - location_dep_city[A,Bringhton] + comm_pair[C,Bristol,A,Bringhton]
   <= 0
 R325: - location_dep_city[A,London] + comm_pair[C,Bristol,A,London] <= 0
 R326: - location_dep_city[B,Bristol] + comm_pair[C,Bristol,B,Bristol]
   <= 0
 R327: - location_dep_city[B,Bringhton] + comm_pair[C,Bristol,B,Bringhton]
   <= 0
 R328: - location_dep_city[B,London] + comm_pair[C,Bristol,B,London] <= 0
 R329: - location_dep_city[C,Bristol] + comm_pair[C,Bristol,C,Bristol]
   <= 0
 R330: - location_dep_city[C,Bringhton] + comm_pair[C,Bristol,C,Bringhton]
   <= 0
 R331: - location_dep_city[C,London] + comm_pair[C,Bristol,C,London] <= 0
 R332: - location_dep_city[D,Bristol] + comm_pair[C,Bristol,D,Bristol]
   <= 0
 R333: - location_dep_city[D,Bringhton] + comm_pair[C,Bristol,D,Bringhton]
   <= 0
 R334: - location_dep_city[D,London] + comm_pair[C,Bristol,D,London] <= 0
 R335: - location_dep_city[E,Bristol] + comm_pair[C,Bristol,E,Bristol]
   <= 0
 R336: - location_dep_city[E,Bringhton] + comm_pair[C,Bristol,E,Bringhton]
   <= 0
 R337: - location_dep_city[E,London] + comm_pair[C,Bristol,E,London] <= 0
 R338: - location_dep_city[A,Bristol] + comm_pair[C,Bringhton,A,Bristol]
   <= 0
 R339: - location_dep_city[A,Bringhton]
   + comm_pair[C,Bringhton,A,Bringhton] <= 0
 R340: - location_dep_city[A,London] + comm_pair[C,Bringhton,A,London]
   <= 0
 R341: - location_dep_city[B,Bristol] + comm_pair[C,Bringhton,B,Bristol]
   <= 0
 R342: - location_dep_city[B,Bringhton]
   + comm_pair[C,Bringhton,B,Bringhton] <= 0
 R343: - location_dep_city[B,London] + comm_pair[C,Bringhton,B,London]
   <= 0
 R344: - location_dep_city[C,Bristol] + comm_pair[C,Bringhton,C,Bristol]
   <= 0
 R345: - location_dep_city[C,Bringhton]
   + comm_pair[C,Bringhton,C,Bringhton] <= 0
 R346: - location_dep_city[C,London] + comm_pair[C,Bringhton,C,London]
   <= 0
 R347: - location_dep_city[D,Bristol] + comm_pair[C,Bringhton,D,Bristol]
   <= 0
 R348: - location_dep_city[D,Bringhton]
   + comm_pair[C,Bringhton,D,Bringhton] <= 0
 R349: - location_dep_city[D,London] + comm_pair[C,Bringhton,D,London]
   <= 0
 R350: - location_dep_city[E,Bristol] + comm_pair[C,Bringhton,E,Bristol]
   <= 0
 R351: - location_dep_city[E,Bringhton]
   + comm_pair[C,Bringhton,E,Bringhton] <= 0
 R352: - location_dep_city[E,London] + comm_pair[C,Bringhton,E,London]
   <= 0
 R353: - location_dep_city[A,Bristol] + comm_pair[C,London,A,Bristol] <= 0
 R354: - location_dep_city[A,Bringhton] + comm_pair[C,London,A,Bringhton]
   <= 0
 R355: - location_dep_city[A,London] + comm_pair[C,London,A,London] <= 0
 R356: - location_dep_city[B,Bristol] + comm_pair[C,London,B,Bristol] <= 0
 R357: - location_dep_city[B,Bringhton] + comm_pair[C,London,B,Bringhton]
   <= 0
 R358: - location_dep_city[B,London] + comm_pair[C,London,B,London] <= 0
 R359: - location_dep_city[C,Bristol] + comm_pair[C,London,C,Bristol] <= 0
 R360: - location_dep_city[C,Bringhton] + comm_pair[C,London,C,Bringhton]
   <= 0
 R361: - location_dep_city[C,London] + comm_pair[C,London,C,London] <= 0
 R362: - location_dep_city[D,Bristol] + comm_pair[C,London,D,Bristol] <= 0
 R363: - location_dep_city[D,Bringhton] + comm_pair[C,London,D,Bringhton]
   <= 0
 R364: - location_dep_city[D,London] + comm_pair[C,London,D,London] <= 0
 R365: - location_dep_city[E,Bristol] + comm_pair[C,London,E,Bristol] <= 0
 R366: - location_dep_city[E,Bringhton] + comm_pair[C,London,E,Bringhton]
   <= 0
 R367: - location_dep_city[E,London] + comm_pair[C,London,E,London] <= 0
 R368: - location_dep_city[A,Bristol] + comm_pair[D,Bristol,A,Bristol]
   <= 0
 R369: - location_dep_city[A,Bringhton] + comm_pair[D,Bristol,A,Bringhton]
   <= 0
 R370: - location_dep_city[A,London] + comm_pair[D,Bristol,A,London] <= 0
 R371: - location_dep_city[B,Bristol] + comm_pair[D,Bristol,B,Bristol]
   <= 0
 R372: - location_dep_city[B,Bringhton] + comm_pair[D,Bristol,B,Bringhton]
   <= 0
 R373: - location_dep_city[B,London] + comm_pair[D,Bristol,B,London] <= 0
 R374: - location_dep_city[C,Bristol] + comm_pair[D,Bristol,C,Bristol]
   <= 0
 R375: - location_dep_city[C,Bringhton] + comm_pair[D,Bristol,C,Bringhton]
   <= 0
 R376: - location_dep_city[C,London] + comm_pair[D,Bristol,C,London] <= 0
 R377: - location_dep_city[D,Bristol] + comm_pair[D,Bristol,D,Bristol]
   <= 0
 R378: - location_dep_city[D,Bringhton] + comm_pair[D,Bristol,D,Bringhton]
   <= 0
 R379: - location_dep_city[D,London] + comm_pair[D,Bristol,D,London] <= 0
 R380: - location_dep_city[E,Bristol] + comm_pair[D,Bristol,E,Bristol]
   <= 0
 R381: - location_dep_city[E,Bringhton] + comm_pair[D,Bristol,E,Bringhton]
   <= 0
 R382: - location_dep_city[E,London] + comm_pair[D,Bristol,E,London] <= 0
 R383: - location_dep_city[A,Bristol] + comm_pair[D,Bringhton,A,Bristol]
   <= 0
 R384: - location_dep_city[A,Bringhton]
   + comm_pair[D,Bringhton,A,Bringhton] <= 0
 R385: - location_dep_city[A,London] + comm_pair[D,Bringhton,A,London]
   <= 0
 R386: - location_dep_city[B,Bristol] + comm_pair[D,Bringhton,B,Bristol]
   <= 0
 R387: - location_dep_city[B,Bringhton]
   + comm_pair[D,Bringhton,B,Bringhton] <= 0
 R388: - location_dep_city[B,London] + comm_pair[D,Bringhton,B,London]
   <= 0
 R389: - location_dep_city[C,Bristol] + comm_pair[D,Bringhton,C,Bristol]
   <= 0
 R390: - location_dep_city[C,Bringhton]
   + comm_pair[D,Bringhton,C,Bringhton] <= 0
 R391: - location_dep_city[C,London] + comm_pair[D,Bringhton,C,London]
   <= 0
 R392: - location_dep_city[D,Bristol] + comm_pair[D,Bringhton,D,Bristol]
   <= 0
 R393: - location_dep_city[D,Bringhton]
   + comm_pair[D,Bringhton,D,Bringhton] <= 0
 R394: - location_dep_city[D,London] + comm_pair[D,Bringhton,D,London]
   <= 0
 R395: - location_dep_city[E,Bristol] + comm_pair[D,Bringhton,E,Bristol]
   <= 0
 R396: - location_dep_city[E,Bringhton]
   + comm_pair[D,Bringhton,E,Bringhton] <= 0
 R397: - location_dep_city[E,London] + comm_pair[D,Bringhton,E,London]
   <= 0
 R398: - location_dep_city[A,Bristol] + comm_pair[D,London,A,Bristol] <= 0
 R399: - location_dep_city[A,Bringhton] + comm_pair[D,London,A,Bringhton]
   <= 0
 R400: - location_dep_city[A,London] + comm_pair[D,London,A,London] <= 0
 R401: - location_dep_city[B,Bristol] + comm_pair[D,London,B,Bristol] <= 0
 R402: - location_dep_city[B,Bringhton] + comm_pair[D,London,B,Bringhton]
   <= 0
 R403: - location_dep_city[B,London] + comm_pair[D,London,B,London] <= 0
 R404: - location_dep_city[C,Bristol] + comm_pair[D,London,C,Bristol] <= 0
 R405: - location_dep_city[C,Bringhton] + comm_pair[D,London,C,Bringhton]
   <= 0
 R406: - location_dep_city[C,London] + comm_pair[D,London,C,London] <= 0
 R407: - location_dep_city[D,Bristol] + comm_pair[D,London,D,Bristol] <= 0
 R408: - location_dep_city[D,Bringhton] + comm_pair[D,London,D,Bringhton]
   <= 0
 R409: - location_dep_city[D,London] + comm_pair[D,London,D,London] <= 0
 R410: - location_dep_city[E,Bristol] + comm_pair[D,London,E,Bristol] <= 0
 R411: - location_dep_city[E,Bringhton] + comm_pair[D,London,E,Bringhton]
   <= 0
 R412: - location_dep_city[E,London] + comm_pair[D,London,E,London] <= 0
 R413: - location_dep_city[A,Bristol] + comm_pair[E,Bristol,A,Bristol]
   <= 0
 R414: - location_dep_city[A,Bringhton] + comm_pair[E,Bristol,A,Bringhton]
   <= 0
 R415: - location_dep_city[A,London] + comm_pair[E,Bristol,A,London] <= 0
 R416: - location_dep_city[B,Bristol] + comm_pair[E,Bristol,B,Bristol]
   <= 0
 R417: - location_dep_city[B,Bringhton] + comm_pair[E,Bristol,B,Bringhton]
   <= 0
 R418: - location_dep_city[B,London] + comm_pair[E,Bristol,B,London] <= 0
 R419: - location_dep_city[C,Bristol] + comm_pair[E,Bristol,C,Bristol]
   <= 0
 R420: - location_dep_city[C,Bringhton] + comm_pair[E,Bristol,C,Bringhton]
   <= 0
 R421: - location_dep_city[C,London] + comm_pair[E,Bristol,C,London] <= 0
 R422: - location_dep_city[D,Bristol] + comm_pair[E,Bristol,D,Bristol]
   <= 0
 R423: - location_dep_city[D,Bringhton] + comm_pair[E,Bristol,D,Bringhton]
   <= 0
 R424: - location_dep_city[D,London] + comm_pair[E,Bristol,D,London] <= 0
 R425: - location_dep_city[E,Bristol] + comm_pair[E,Bristol,E,Bristol]
   <= 0
 R426: - location_dep_city[E,Bringhton] + comm_pair[E,Bristol,E,Bringhton]
   <= 0
 R427: - location_dep_city[E,London] + comm_pair[E,Bristol,E,London] <= 0
 R428: - location_dep_city[A,Bristol] + comm_pair[E,Bringhton,A,Bristol]
   <= 0
 R429: - location_dep_city[A,Bringhton]
   + comm_pair[E,Bringhton,A,Bringhton] <= 0
 R430: - location_dep_city[A,London] + comm_pair[E,Bringhton,A,London]
   <= 0
 R431: - location_dep_city[B,Bristol] + comm_pair[E,Bringhton,B,Bristol]
   <= 0
 R432: - location_dep_city[B,Bringhton]
   + comm_pair[E,Bringhton,B,Bringhton] <= 0
 R433: - location_dep_city[B,London] + comm_pair[E,Bringhton,B,London]
   <= 0
 R434: - location_dep_city[C,Bristol] + comm_pair[E,Bringhton,C,Bristol]
   <= 0
 R435: - location_dep_city[C,Bringhton]
   + comm_pair[E,Bringhton,C,Bringhton] <= 0
 R436: - location_dep_city[C,London] + comm_pair[E,Bringhton,C,London]
   <= 0
 R437: - location_dep_city[D,Bristol] + comm_pair[E,Bringhton,D,Bristol]
   <= 0
 R438: - location_dep_city[D,Bringhton]
   + comm_pair[E,Bringhton,D,Bringhton] <= 0
 R439: - location_dep_city[D,London] + comm_pair[E,Bringhton,D,London]
   <= 0
 R440: - location_dep_city[E,Bristol] + comm_pair[E,Bringhton,E,Bristol]
   <= 0
 R441: - location_dep_city[E,Bringhton]
   + comm_pair[E,Bringhton,E,Bringhton] <= 0
 R442: - location_dep_city[E,London] + comm_pair[E,Bringhton,E,London]
   <= 0
 R443: - location_dep_city[A,Bristol] + comm_pair[E,London,A,Bristol] <= 0
 R444: - location_dep_city[A,Bringhton] + comm_pair[E,London,A,Bringhton]
   <= 0
 R445: - location_dep_city[A,London] + comm_pair[E,London,A,London] <= 0
 R446: - location_dep_city[B,Bristol] + comm_pair[E,London,B,Bristol] <= 0
 R447: - location_dep_city[B,Bringhton] + comm_pair[E,London,B,Bringhton]
   <= 0
 R448: - location_dep_city[B,London] + comm_pair[E,London,B,London] <= 0
 R449: - location_dep_city[C,Bristol] + comm_pair[E,London,C,Bristol] <= 0
 R450: - location_dep_city[C,Bringhton] + comm_pair[E,London,C,Bringhton]
   <= 0
 R451: - location_dep_city[C,London] + comm_pair[E,London,C,London] <= 0
 R452: - location_dep_city[D,Bristol] + comm_pair[E,London,D,Bristol] <= 0
 R453: - location_dep_city[D,Bringhton] + comm_pair[E,London,D,Bringhton]
   <= 0
 R454: - location_dep_city[D,London] + comm_pair[E,London,D,London] <= 0
 R455: - location_dep_city[E,Bristol] + comm_pair[E,London,E,Bristol] <= 0
 R456: - location_dep_city[E,Bringhton] + comm_pair[E,London,E,Bringhton]
   <= 0
 R457: - location_dep_city[E,London] + comm_pair[E,London,E,London] <= 0
 R458: 2 location_dep_city[A,Bristol] - comm_pair[A,Bristol,A,Bristol]
   <= 1
 R459: location_dep_city[A,Bristol] + location_dep_city[A,Bringhton]
   - comm_pair[A,Bristol,A,Bringhton] <= 1
 R460: location_dep_city[A,Bristol] + location_dep_city[A,London]
   - comm_pair[A,Bristol,A,London] <= 1
 R461: location_dep_city[A,Bristol] + location_dep_city[B,Bristol]
   - comm_pair[A,Bristol,B,Bristol] <= 1
 R462: location_dep_city[A,Bristol] + location_dep_city[B,Bringhton]
   - comm_pair[A,Bristol,B,Bringhton] <= 1
 R463: location_dep_city[A,Bristol] + location_dep_city[B,London]
   - comm_pair[A,Bristol,B,London] <= 1
 R464: location_dep_city[A,Bristol] + location_dep_city[C,Bristol]
   - comm_pair[A,Bristol,C,Bristol] <= 1
 R465: location_dep_city[A,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[A,Bristol,C,Bringhton] <= 1
 R466: location_dep_city[A,Bristol] + location_dep_city[C,London]
   - comm_pair[A,Bristol,C,London] <= 1
 R467: location_dep_city[A,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[A,Bristol,D,Bristol] <= 1
 R468: location_dep_city[A,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[A,Bristol,D,Bringhton] <= 1
 R469: location_dep_city[A,Bristol] + location_dep_city[D,London]
   - comm_pair[A,Bristol,D,London] <= 1
 R470: location_dep_city[A,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[A,Bristol,E,Bristol] <= 1
 R471: location_dep_city[A,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[A,Bristol,E,Bringhton] <= 1
 R472: location_dep_city[A,Bristol] + location_dep_city[E,London]
   - comm_pair[A,Bristol,E,London] <= 1
 R473: location_dep_city[A,Bristol] + location_dep_city[A,Bringhton]
   - comm_pair[A,Bringhton,A,Bristol] <= 1
 R474: 2 location_dep_city[A,Bringhton]
   - comm_pair[A,Bringhton,A,Bringhton] <= 1
 R475: location_dep_city[A,Bringhton] + location_dep_city[A,London]
   - comm_pair[A,Bringhton,A,London] <= 1
 R476: location_dep_city[A,Bringhton] + location_dep_city[B,Bristol]
   - comm_pair[A,Bringhton,B,Bristol] <= 1
 R477: location_dep_city[A,Bringhton] + location_dep_city[B,Bringhton]
   - comm_pair[A,Bringhton,B,Bringhton] <= 1
 R478: location_dep_city[A,Bringhton] + location_dep_city[B,London]
   - comm_pair[A,Bringhton,B,London] <= 1
 R479: location_dep_city[A,Bringhton] + location_dep_city[C,Bristol]
   - comm_pair[A,Bringhton,C,Bristol] <= 1
 R480: location_dep_city[A,Bringhton] + location_dep_city[C,Bringhton]
   - comm_pair[A,Bringhton,C,Bringhton] <= 1
 R481: location_dep_city[A,Bringhton] + location_dep_city[C,London]
   - comm_pair[A,Bringhton,C,London] <= 1
 R482: location_dep_city[A,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[A,Bringhton,D,Bristol] <= 1
 R483: location_dep_city[A,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[A,Bringhton,D,Bringhton] <= 1
 R484: location_dep_city[A,Bringhton] + location_dep_city[D,London]
   - comm_pair[A,Bringhton,D,London] <= 1
 R485: location_dep_city[A,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[A,Bringhton,E,Bristol] <= 1
 R486: location_dep_city[A,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[A,Bringhton,E,Bringhton] <= 1
 R487: location_dep_city[A,Bringhton] + location_dep_city[E,London]
   - comm_pair[A,Bringhton,E,London] <= 1
 R488: location_dep_city[A,Bristol] + location_dep_city[A,London]
   - comm_pair[A,London,A,Bristol] <= 1
 R489: location_dep_city[A,Bringhton] + location_dep_city[A,London]
   - comm_pair[A,London,A,Bringhton] <= 1
 R490: 2 location_dep_city[A,London] - comm_pair[A,London,A,London] <= 1
 R491: location_dep_city[A,London] + location_dep_city[B,Bristol]
   - comm_pair[A,London,B,Bristol] <= 1
 R492: location_dep_city[A,London] + location_dep_city[B,Bringhton]
   - comm_pair[A,London,B,Bringhton] <= 1
 R493: location_dep_city[A,London] + location_dep_city[B,London]
   - comm_pair[A,London,B,London] <= 1
 R494: location_dep_city[A,London] + location_dep_city[C,Bristol]
   - comm_pair[A,London,C,Bristol] <= 1
 R495: location_dep_city[A,London] + location_dep_city[C,Bringhton]
   - comm_pair[A,London,C,Bringhton] <= 1
 R496: location_dep_city[A,London] + location_dep_city[C,London]
   - comm_pair[A,London,C,London] <= 1
 R497: location_dep_city[A,London] + location_dep_city[D,Bristol]
   - comm_pair[A,London,D,Bristol] <= 1
 R498: location_dep_city[A,London] + location_dep_city[D,Bringhton]
   - comm_pair[A,London,D,Bringhton] <= 1
 R499: location_dep_city[A,London] + location_dep_city[D,London]
   - comm_pair[A,London,D,London] <= 1
 R500: location_dep_city[A,London] + location_dep_city[E,Bristol]
   - comm_pair[A,London,E,Bristol] <= 1
 R501: location_dep_city[A,London] + location_dep_city[E,Bringhton]
   - comm_pair[A,London,E,Bringhton] <= 1
 R502: location_dep_city[A,London] + location_dep_city[E,London]
   - comm_pair[A,London,E,London] <= 1
 R503: location_dep_city[A,Bristol] + location_dep_city[B,Bristol]
   - comm_pair[B,Bristol,A,Bristol] <= 1
 R504: location_dep_city[A,Bringhton] + location_dep_city[B,Bristol]
   - comm_pair[B,Bristol,A,Bringhton] <= 1
 R505: location_dep_city[A,London] + location_dep_city[B,Bristol]
   - comm_pair[B,Bristol,A,London] <= 1
 R506: 2 location_dep_city[B,Bristol] - comm_pair[B,Bristol,B,Bristol]
   <= 1
 R507: location_dep_city[B,Bristol] + location_dep_city[B,Bringhton]
   - comm_pair[B,Bristol,B,Bringhton] <= 1
 R508: location_dep_city[B,Bristol] + location_dep_city[B,London]
   - comm_pair[B,Bristol,B,London] <= 1
 R509: location_dep_city[B,Bristol] + location_dep_city[C,Bristol]
   - comm_pair[B,Bristol,C,Bristol] <= 1
 R510: location_dep_city[B,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[B,Bristol,C,Bringhton] <= 1
 R511: location_dep_city[B,Bristol] + location_dep_city[C,London]
   - comm_pair[B,Bristol,C,London] <= 1
 R512: location_dep_city[B,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[B,Bristol,D,Bristol] <= 1
 R513: location_dep_city[B,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[B,Bristol,D,Bringhton] <= 1
 R514: location_dep_city[B,Bristol] + location_dep_city[D,London]
   - comm_pair[B,Bristol,D,London] <= 1
 R515: location_dep_city[B,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[B,Bristol,E,Bristol] <= 1
 R516: location_dep_city[B,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[B,Bristol,E,Bringhton] <= 1
 R517: location_dep_city[B,Bristol] + location_dep_city[E,London]
   - comm_pair[B,Bristol,E,London] <= 1
 R518: location_dep_city[A,Bristol] + location_dep_city[B,Bringhton]
   - comm_pair[B,Bringhton,A,Bristol] <= 1
 R519: location_dep_city[A,Bringhton] + location_dep_city[B,Bringhton]
   - comm_pair[B,Bringhton,A,Bringhton] <= 1
 R520: location_dep_city[A,London] + location_dep_city[B,Bringhton]
   - comm_pair[B,Bringhton,A,London] <= 1
 R521: location_dep_city[B,Bristol] + location_dep_city[B,Bringhton]
   - comm_pair[B,Bringhton,B,Bristol] <= 1
 R522: 2 location_dep_city[B,Bringhton]
   - comm_pair[B,Bringhton,B,Bringhton] <= 1
 R523: location_dep_city[B,Bringhton] + location_dep_city[B,London]
   - comm_pair[B,Bringhton,B,London] <= 1
 R524: location_dep_city[B,Bringhton] + location_dep_city[C,Bristol]
   - comm_pair[B,Bringhton,C,Bristol] <= 1
 R525: location_dep_city[B,Bringhton] + location_dep_city[C,Bringhton]
   - comm_pair[B,Bringhton,C,Bringhton] <= 1
 R526: location_dep_city[B,Bringhton] + location_dep_city[C,London]
   - comm_pair[B,Bringhton,C,London] <= 1
 R527: location_dep_city[B,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[B,Bringhton,D,Bristol] <= 1
 R528: location_dep_city[B,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[B,Bringhton,D,Bringhton] <= 1
 R529: location_dep_city[B,Bringhton] + location_dep_city[D,London]
   - comm_pair[B,Bringhton,D,London] <= 1
 R530: location_dep_city[B,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[B,Bringhton,E,Bristol] <= 1
 R531: location_dep_city[B,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[B,Bringhton,E,Bringhton] <= 1
 R532: location_dep_city[B,Bringhton] + location_dep_city[E,London]
   - comm_pair[B,Bringhton,E,London] <= 1
 R533: location_dep_city[A,Bristol] + location_dep_city[B,London]
   - comm_pair[B,London,A,Bristol] <= 1
 R534: location_dep_city[A,Bringhton] + location_dep_city[B,London]
   - comm_pair[B,London,A,Bringhton] <= 1
 R535: location_dep_city[A,London] + location_dep_city[B,London]
   - comm_pair[B,London,A,London] <= 1
 R536: location_dep_city[B,Bristol] + location_dep_city[B,London]
   - comm_pair[B,London,B,Bristol] <= 1
 R537: location_dep_city[B,Bringhton] + location_dep_city[B,London]
   - comm_pair[B,London,B,Bringhton] <= 1
 R538: 2 location_dep_city[B,London] - comm_pair[B,London,B,London] <= 1
 R539: location_dep_city[B,London] + location_dep_city[C,Bristol]
   - comm_pair[B,London,C,Bristol] <= 1
 R540: location_dep_city[B,London] + location_dep_city[C,Bringhton]
   - comm_pair[B,London,C,Bringhton] <= 1
 R541: location_dep_city[B,London] + location_dep_city[C,London]
   - comm_pair[B,London,C,London] <= 1
 R542: location_dep_city[B,London] + location_dep_city[D,Bristol]
   - comm_pair[B,London,D,Bristol] <= 1
 R543: location_dep_city[B,London] + location_dep_city[D,Bringhton]
   - comm_pair[B,London,D,Bringhton] <= 1
 R544: location_dep_city[B,London] + location_dep_city[D,London]
   - comm_pair[B,London,D,London] <= 1
 R545: location_dep_city[B,London] + location_dep_city[E,Bristol]
   - comm_pair[B,London,E,Bristol] <= 1
 R546: location_dep_city[B,London] + location_dep_city[E,Bringhton]
   - comm_pair[B,London,E,Bringhton] <= 1
 R547: location_dep_city[B,London] + location_dep_city[E,London]
   - comm_pair[B,London,E,London] <= 1
 R548: location_dep_city[A,Bristol] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,A,Bristol] <= 1
 R549: location_dep_city[A,Bringhton] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,A,Bringhton] <= 1
 R550: location_dep_city[A,London] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,A,London] <= 1
 R551: location_dep_city[B,Bristol] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,B,Bristol] <= 1
 R552: location_dep_city[B,Bringhton] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,B,Bringhton] <= 1
 R553: location_dep_city[B,London] + location_dep_city[C,Bristol]
   - comm_pair[C,Bristol,B,London] <= 1
 R554: 2 location_dep_city[C,Bristol] - comm_pair[C,Bristol,C,Bristol]
   <= 1
 R555: location_dep_city[C,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bristol,C,Bringhton] <= 1
 R556: location_dep_city[C,Bristol] + location_dep_city[C,London]
   - comm_pair[C,Bristol,C,London] <= 1
 R557: location_dep_city[C,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[C,Bristol,D,Bristol] <= 1
 R558: location_dep_city[C,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[C,Bristol,D,Bringhton] <= 1
 R559: location_dep_city[C,Bristol] + location_dep_city[D,London]
   - comm_pair[C,Bristol,D,London] <= 1
 R560: location_dep_city[C,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[C,Bristol,E,Bristol] <= 1
 R561: location_dep_city[C,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[C,Bristol,E,Bringhton] <= 1
 R562: location_dep_city[C,Bristol] + location_dep_city[E,London]
   - comm_pair[C,Bristol,E,London] <= 1
 R563: location_dep_city[A,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,A,Bristol] <= 1
 R564: location_dep_city[A,Bringhton] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,A,Bringhton] <= 1
 R565: location_dep_city[A,London] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,A,London] <= 1
 R566: location_dep_city[B,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,B,Bristol] <= 1
 R567: location_dep_city[B,Bringhton] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,B,Bringhton] <= 1
 R568: location_dep_city[B,London] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,B,London] <= 1
 R569: location_dep_city[C,Bristol] + location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,C,Bristol] <= 1
 R570: 2 location_dep_city[C,Bringhton]
   - comm_pair[C,Bringhton,C,Bringhton] <= 1
 R571: location_dep_city[C,Bringhton] + location_dep_city[C,London]
   - comm_pair[C,Bringhton,C,London] <= 1
 R572: location_dep_city[C,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[C,Bringhton,D,Bristol] <= 1
 R573: location_dep_city[C,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[C,Bringhton,D,Bringhton] <= 1
 R574: location_dep_city[C,Bringhton] + location_dep_city[D,London]
   - comm_pair[C,Bringhton,D,London] <= 1
 R575: location_dep_city[C,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[C,Bringhton,E,Bristol] <= 1
 R576: location_dep_city[C,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[C,Bringhton,E,Bringhton] <= 1
 R577: location_dep_city[C,Bringhton] + location_dep_city[E,London]
   - comm_pair[C,Bringhton,E,London] <= 1
 R578: location_dep_city[A,Bristol] + location_dep_city[C,London]
   - comm_pair[C,London,A,Bristol] <= 1
 R579: location_dep_city[A,Bringhton] + location_dep_city[C,London]
   - comm_pair[C,London,A,Bringhton] <= 1
 R580: location_dep_city[A,London] + location_dep_city[C,London]
   - comm_pair[C,London,A,London] <= 1
 R581: location_dep_city[B,Bristol] + location_dep_city[C,London]
   - comm_pair[C,London,B,Bristol] <= 1
 R582: location_dep_city[B,Bringhton] + location_dep_city[C,London]
   - comm_pair[C,London,B,Bringhton] <= 1
 R583: location_dep_city[B,London] + location_dep_city[C,London]
   - comm_pair[C,London,B,London] <= 1
 R584: location_dep_city[C,Bristol] + location_dep_city[C,London]
   - comm_pair[C,London,C,Bristol] <= 1
 R585: location_dep_city[C,Bringhton] + location_dep_city[C,London]
   - comm_pair[C,London,C,Bringhton] <= 1
 R586: 2 location_dep_city[C,London] - comm_pair[C,London,C,London] <= 1
 R587: location_dep_city[C,London] + location_dep_city[D,Bristol]
   - comm_pair[C,London,D,Bristol] <= 1
 R588: location_dep_city[C,London] + location_dep_city[D,Bringhton]
   - comm_pair[C,London,D,Bringhton] <= 1
 R589: location_dep_city[C,London] + location_dep_city[D,London]
   - comm_pair[C,London,D,London] <= 1
 R590: location_dep_city[C,London] + location_dep_city[E,Bristol]
   - comm_pair[C,London,E,Bristol] <= 1
 R591: location_dep_city[C,London] + location_dep_city[E,Bringhton]
   - comm_pair[C,London,E,Bringhton] <= 1
 R592: location_dep_city[C,London] + location_dep_city[E,London]
   - comm_pair[C,London,E,London] <= 1
 R593: location_dep_city[A,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,A,Bristol] <= 1
 R594: location_dep_city[A,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,A,Bringhton] <= 1
 R595: location_dep_city[A,London] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,A,London] <= 1
 R596: location_dep_city[B,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,B,Bristol] <= 1
 R597: location_dep_city[B,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,B,Bringhton] <= 1
 R598: location_dep_city[B,London] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,B,London] <= 1
 R599: location_dep_city[C,Bristol] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,C,Bristol] <= 1
 R600: location_dep_city[C,Bringhton] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,C,Bringhton] <= 1
 R601: location_dep_city[C,London] + location_dep_city[D,Bristol]
   - comm_pair[D,Bristol,C,London] <= 1
 R602: 2 location_dep_city[D,Bristol] - comm_pair[D,Bristol,D,Bristol]
   <= 1
 R603: location_dep_city[D,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bristol,D,Bringhton] <= 1
 R604: location_dep_city[D,Bristol] + location_dep_city[D,London]
   - comm_pair[D,Bristol,D,London] <= 1
 R605: location_dep_city[D,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[D,Bristol,E,Bristol] <= 1
 R606: location_dep_city[D,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[D,Bristol,E,Bringhton] <= 1
 R607: location_dep_city[D,Bristol] + location_dep_city[E,London]
   - comm_pair[D,Bristol,E,London] <= 1
 R608: location_dep_city[A,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,A,Bristol] <= 1
 R609: location_dep_city[A,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,A,Bringhton] <= 1
 R610: location_dep_city[A,London] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,A,London] <= 1
 R611: location_dep_city[B,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,B,Bristol] <= 1
 R612: location_dep_city[B,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,B,Bringhton] <= 1
 R613: location_dep_city[B,London] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,B,London] <= 1
 R614: location_dep_city[C,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,C,Bristol] <= 1
 R615: location_dep_city[C,Bringhton] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,C,Bringhton] <= 1
 R616: location_dep_city[C,London] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,C,London] <= 1
 R617: location_dep_city[D,Bristol] + location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,D,Bristol] <= 1
 R618: 2 location_dep_city[D,Bringhton]
   - comm_pair[D,Bringhton,D,Bringhton] <= 1
 R619: location_dep_city[D,Bringhton] + location_dep_city[D,London]
   - comm_pair[D,Bringhton,D,London] <= 1
 R620: location_dep_city[D,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[D,Bringhton,E,Bristol] <= 1
 R621: location_dep_city[D,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[D,Bringhton,E,Bringhton] <= 1
 R622: location_dep_city[D,Bringhton] + location_dep_city[E,London]
   - comm_pair[D,Bringhton,E,London] <= 1
 R623: location_dep_city[A,Bristol] + location_dep_city[D,London]
   - comm_pair[D,London,A,Bristol] <= 1
 R624: location_dep_city[A,Bringhton] + location_dep_city[D,London]
   - comm_pair[D,London,A,Bringhton] <= 1
 R625: location_dep_city[A,London] + location_dep_city[D,London]
   - comm_pair[D,London,A,London] <= 1
 R626: location_dep_city[B,Bristol] + location_dep_city[D,London]
   - comm_pair[D,London,B,Bristol] <= 1
 R627: location_dep_city[B,Bringhton] + location_dep_city[D,London]
   - comm_pair[D,London,B,Bringhton] <= 1
 R628: location_dep_city[B,London] + location_dep_city[D,London]
   - comm_pair[D,London,B,London] <= 1
 R629: location_dep_city[C,Bristol] + location_dep_city[D,London]
   - comm_pair[D,London,C,Bristol] <= 1
 R630: location_dep_city[C,Bringhton] + location_dep_city[D,London]
   - comm_pair[D,London,C,Bringhton] <= 1
 R631: location_dep_city[C,London] + location_dep_city[D,London]
   - comm_pair[D,London,C,London] <= 1
 R632: location_dep_city[D,Bristol] + location_dep_city[D,London]
   - comm_pair[D,London,D,Bristol] <= 1
 R633: location_dep_city[D,Bringhton] + location_dep_city[D,London]
   - comm_pair[D,London,D,Bringhton] <= 1
 R634: 2 location_dep_city[D,London] - comm_pair[D,London,D,London] <= 1
 R635: location_dep_city[D,London] + location_dep_city[E,Bristol]
   - comm_pair[D,London,E,Bristol] <= 1
 R636: location_dep_city[D,London] + location_dep_city[E,Bringhton]
   - comm_pair[D,London,E,Bringhton] <= 1
 R637: location_dep_city[D,London] + location_dep_city[E,London]
   - comm_pair[D,London,E,London] <= 1
 R638: location_dep_city[A,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,A,Bristol] <= 1
 R639: location_dep_city[A,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,A,Bringhton] <= 1
 R640: location_dep_city[A,London] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,A,London] <= 1
 R641: location_dep_city[B,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,B,Bristol] <= 1
 R642: location_dep_city[B,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,B,Bringhton] <= 1
 R643: location_dep_city[B,London] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,B,London] <= 1
 R644: location_dep_city[C,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,C,Bristol] <= 1
 R645: location_dep_city[C,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,C,Bringhton] <= 1
 R646: location_dep_city[C,London] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,C,London] <= 1
 R647: location_dep_city[D,Bristol] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,D,Bristol] <= 1
 R648: location_dep_city[D,Bringhton] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,D,Bringhton] <= 1
 R649: location_dep_city[D,London] + location_dep_city[E,Bristol]
   - comm_pair[E,Bristol,D,London] <= 1
 R650: 2 location_dep_city[E,Bristol] - comm_pair[E,Bristol,E,Bristol]
   <= 1
 R651: location_dep_city[E,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bristol,E,Bringhton] <= 1
 R652: location_dep_city[E,Bristol] + location_dep_city[E,London]
   - comm_pair[E,Bristol,E,London] <= 1
 R653: location_dep_city[A,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,A,Bristol] <= 1
 R654: location_dep_city[A,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,A,Bringhton] <= 1
 R655: location_dep_city[A,London] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,A,London] <= 1
 R656: location_dep_city[B,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,B,Bristol] <= 1
 R657: location_dep_city[B,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,B,Bringhton] <= 1
 R658: location_dep_city[B,London] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,B,London] <= 1
 R659: location_dep_city[C,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,C,Bristol] <= 1
 R660: location_dep_city[C,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,C,Bringhton] <= 1
 R661: location_dep_city[C,London] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,C,London] <= 1
 R662: location_dep_city[D,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,D,Bristol] <= 1
 R663: location_dep_city[D,Bringhton] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,D,Bringhton] <= 1
 R664: location_dep_city[D,London] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,D,London] <= 1
 R665: location_dep_city[E,Bristol] + location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,E,Bristol] <= 1
 R666: 2 location_dep_city[E,Bringhton]
   - comm_pair[E,Bringhton,E,Bringhton] <= 1
 R667: location_dep_city[E,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,Bringhton,E,London] <= 1
 R668: location_dep_city[A,Bristol] + location_dep_city[E,London]
   - comm_pair[E,London,A,Bristol] <= 1
 R669: location_dep_city[A,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,London,A,Bringhton] <= 1
 R670: location_dep_city[A,London] + location_dep_city[E,London]
   - comm_pair[E,London,A,London] <= 1
 R671: location_dep_city[B,Bristol] + location_dep_city[E,London]
   - comm_pair[E,London,B,Bristol] <= 1
 R672: location_dep_city[B,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,London,B,Bringhton] <= 1
 R673: location_dep_city[B,London] + location_dep_city[E,London]
   - comm_pair[E,London,B,London] <= 1
 R674: location_dep_city[C,Bristol] + location_dep_city[E,London]
   - comm_pair[E,London,C,Bristol] <= 1
 R675: location_dep_city[C,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,London,C,Bringhton] <= 1
 R676: location_dep_city[C,London] + location_dep_city[E,London]
   - comm_pair[E,London,C,London] <= 1
 R677: location_dep_city[D,Bristol] + location_dep_city[E,London]
   - comm_pair[E,London,D,Bristol] <= 1
 R678: location_dep_city[D,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,London,D,Bringhton] <= 1
 R679: location_dep_city[D,London] + location_dep_city[E,London]
   - comm_pair[E,London,D,London] <= 1
 R680: location_dep_city[E,Bristol] + location_dep_city[E,London]
   - comm_pair[E,London,E,Bristol] <= 1
 R681: location_dep_city[E,Bringhton] + location_dep_city[E,London]
   - comm_pair[E,London,E,Bringhton] <= 1
 R682: 2 location_dep_city[E,London] - comm_pair[E,London,E,London] <= 1
Bounds
Binaries
 location_dep_city[A,Bristol] location_dep_city[A,Bringhton]
 location_dep_city[A,London] location_dep_city[B,Bristol]
 location_dep_city[B,Bringhton] location_dep_city[B,London]
 location_dep_city[C,Bristol] location_dep_city[C,Bringhton]
 location_dep_city[C,London] location_dep_city[D,Bristol]
 location_dep_city[D,Bringhton] location_dep_city[D,London]
 location_dep_city[E,Bristol] location_dep_city[E,Bringhton]
 location_dep_city[E,London] comm_pair[A,Bristol,A,Bristol]
 comm_pair[A,Bristol,A,Bringhton] comm_pair[A,Bristol,A,London]
 comm_pair[A,Bristol,B,Bristol] comm_pair[A,Bristol,B,Bringhton]
 comm_pair[A,Bristol,B,London] comm_pair[A,Bristol,C,Bristol]
 comm_pair[A,Bristol,C,Bringhton] comm_pair[A,Bristol,C,London]
 comm_pair[A,Bristol,D,Bristol] comm_pair[A,Bristol,D,Bringhton]
 comm_pair[A,Bristol,D,London] comm_pair[A,Bristol,E,Bristol]
 comm_pair[A,Bristol,E,Bringhton] comm_pair[A,Bristol,E,London]
 comm_pair[A,Bringhton,A,Bristol] comm_pair[A,Bringhton,A,Bringhton]
 comm_pair[A,Bringhton,A,London] comm_pair[A,Bringhton,B,Bristol]
 comm_pair[A,Bringhton,B,Bringhton] comm_pair[A,Bringhton,B,London]
 comm_pair[A,Bringhton,C,Bristol] comm_pair[A,Bringhton,C,Bringhton]
 comm_pair[A,Bringhton,C,London] comm_pair[A,Bringhton,D,Bristol]
 comm_pair[A,Bringhton,D,Bringhton] comm_pair[A,Bringhton,D,London]
 comm_pair[A,Bringhton,E,Bristol] comm_pair[A,Bringhton,E,Bringhton]
 comm_pair[A,Bringhton,E,London] comm_pair[A,London,A,Bristol]
 comm_pair[A,London,A,Bringhton] comm_pair[A,London,A,London]
 comm_pair[A,London,B,Bristol] comm_pair[A,London,B,Bringhton]
 comm_pair[A,London,B,London] comm_pair[A,London,C,Bristol]
 comm_pair[A,London,C,Bringhton] comm_pair[A,London,C,London]
 comm_pair[A,London,D,Bristol] comm_pair[A,London,D,Bringhton]
 comm_pair[A,London,D,London] comm_pair[A,London,E,Bristol]
 comm_pair[A,London,E,Bringhton] comm_pair[A,London,E,London]
 comm_pair[B,Bristol,A,Bristol] comm_pair[B,Bristol,A,Bringhton]
 comm_pair[B,Bristol,A,London] comm_pair[B,Bristol,B,Bristol]
 comm_pair[B,Bristol,B,Bringhton] comm_pair[B,Bristol,B,London]
 comm_pair[B,Bristol,C,Bristol] comm_pair[B,Bristol,C,Bringhton]
 comm_pair[B,Bristol,C,London] comm_pair[B,Bristol,D,Bristol]
 comm_pair[B,Bristol,D,Bringhton] comm_pair[B,Bristol,D,London]
 comm_pair[B,Bristol,E,Bristol] comm_pair[B,Bristol,E,Bringhton]
 comm_pair[B,Bristol,E,London] comm_pair[B,Bringhton,A,Bristol]
 comm_pair[B,Bringhton,A,Bringhton] comm_pair[B,Bringhton,A,London]
 comm_pair[B,Bringhton,B,Bristol] comm_pair[B,Bringhton,B,Bringhton]
 comm_pair[B,Bringhton,B,London] comm_pair[B,Bringhton,C,Bristol]
 comm_pair[B,Bringhton,C,Bringhton] comm_pair[B,Bringhton,C,London]
 comm_pair[B,Bringhton,D,Bristol] comm_pair[B,Bringhton,D,Bringhton]
 comm_pair[B,Bringhton,D,London] comm_pair[B,Bringhton,E,Bristol]
 comm_pair[B,Bringhton,E,Bringhton] comm_pair[B,Bringhton,E,London]
 comm_pair[B,London,A,Bristol] comm_pair[B,London,A,Bringhton]
 comm_pair[B,London,A,London] comm_pair[B,London,B,Bristol]
 comm_pair[B,London,B,Bringhton] comm_pair[B,London,B,London]
 comm_pair[B,London,C,Bristol] comm_pair[B,London,C,Bringhton]
 comm_pair[B,London,C,London] comm_pair[B,London,D,Bristol]
 comm_pair[B,London,D,Bringhton] comm_pair[B,London,D,London]
 comm_pair[B,London,E,Bristol] comm_pair[B,London,E,Bringhton]
 comm_pair[B,London,E,London] comm_pair[C,Bristol,A,Bristol]
 comm_pair[C,Bristol,A,Bringhton] comm_pair[C,Bristol,A,London]
 comm_pair[C,Bristol,B,Bristol] comm_pair[C,Bristol,B,Bringhton]
 comm_pair[C,Bristol,B,London] comm_pair[C,Bristol,C,Bristol]
 comm_pair[C,Bristol,C,Bringhton] comm_pair[C,Bristol,C,London]
 comm_pair[C,Bristol,D,Bristol] comm_pair[C,Bristol,D,Bringhton]
 comm_pair[C,Bristol,D,London] comm_pair[C,Bristol,E,Bristol]
 comm_pair[C,Bristol,E,Bringhton] comm_pair[C,Bristol,E,London]
 comm_pair[C,Bringhton,A,Bristol] comm_pair[C,Bringhton,A,Bringhton]
 comm_pair[C,Bringhton,A,London] comm_pair[C,Bringhton,B,Bristol]
 comm_pair[C,Bringhton,B,Bringhton] comm_pair[C,Bringhton,B,London]
 comm_pair[C,Bringhton,C,Bristol] comm_pair[C,Bringhton,C,Bringhton]
 comm_pair[C,Bringhton,C,London] comm_pair[C,Bringhton,D,Bristol]
 comm_pair[C,Bringhton,D,Bringhton] comm_pair[C,Bringhton,D,London]
 comm_pair[C,Bringhton,E,Bristol] comm_pair[C,Bringhton,E,Bringhton]
 comm_pair[C,Bringhton,E,London] comm_pair[C,London,A,Bristol]
 comm_pair[C,London,A,Bringhton] comm_pair[C,London,A,London]
 comm_pair[C,London,B,Bristol] comm_pair[C,London,B,Bringhton]
 comm_pair[C,London,B,London] comm_pair[C,London,C,Bristol]
 comm_pair[C,London,C,Bringhton] comm_pair[C,London,C,London]
 comm_pair[C,London,D,Bristol] comm_pair[C,London,D,Bringhton]
 comm_pair[C,London,D,London] comm_pair[C,London,E,Bristol]
 comm_pair[C,London,E,Bringhton] comm_pair[C,London,E,London]
 comm_pair[D,Bristol,A,Bristol] comm_pair[D,Bristol,A,Bringhton]
 comm_pair[D,Bristol,A,London] comm_pair[D,Bristol,B,Bristol]
 comm_pair[D,Bristol,B,Bringhton] comm_pair[D,Bristol,B,London]
 comm_pair[D,Bristol,C,Bristol] comm_pair[D,Bristol,C,Bringhton]
 comm_pair[D,Bristol,C,London] comm_pair[D,Bristol,D,Bristol]
 comm_pair[D,Bristol,D,Bringhton] comm_pair[D,Bristol,D,London]
 comm_pair[D,Bristol,E,Bristol] comm_pair[D,Bristol,E,Bringhton]
 comm_pair[D,Bristol,E,London] comm_pair[D,Bringhton,A,Bristol]
 comm_pair[D,Bringhton,A,Bringhton] comm_pair[D,Bringhton,A,London]
 comm_pair[D,Bringhton,B,Bristol] comm_pair[D,Bringhton,B,Bringhton]
 comm_pair[D,Bringhton,B,London] comm_pair[D,Bringhton,C,Bristol]
 comm_pair[D,Bringhton,C,Bringhton] comm_pair[D,Bringhton,C,London]
 comm_pair[D,Bringhton,D,Bristol] comm_pair[D,Bringhton,D,Bringhton]
 comm_pair[D,Bringhton,D,London] comm_pair[D,Bringhton,E,Bristol]
 comm_pair[D,Bringhton,E,Bringhton] comm_pair[D,Bringhton,E,London]
 comm_pair[D,London,A,Bristol] comm_pair[D,London,A,Bringhton]
 comm_pair[D,London,A,London] comm_pair[D,London,B,Bristol]
 comm_pair[D,London,B,Bringhton] comm_pair[D,London,B,London]
 comm_pair[D,London,C,Bristol] comm_pair[D,London,C,Bringhton]
 comm_pair[D,London,C,London] comm_pair[D,London,D,Bristol]
 comm_pair[D,London,D,Bringhton] comm_pair[D,London,D,London]
 comm_pair[D,London,E,Bristol] comm_pair[D,London,E,Bringhton]
 comm_pair[D,London,E,London] comm_pair[E,Bristol,A,Bristol]
 comm_pair[E,Bristol,A,Bringhton] comm_pair[E,Bristol,A,London]
 comm_pair[E,Bristol,B,Bristol] comm_pair[E,Bristol,B,Bringhton]
 comm_pair[E,Bristol,B,London] comm_pair[E,Bristol,C,Bristol]
 comm_pair[E,Bristol,C,Bringhton] comm_pair[E,Bristol,C,London]
 comm_pair[E,Bristol,D,Bristol] comm_pair[E,Bristol,D,Bringhton]
 comm_pair[E,Bristol,D,London] comm_pair[E,Bristol,E,Bristol]
 comm_pair[E,Bristol,E,Bringhton] comm_pair[E,Bristol,E,London]
 comm_pair[E,Bringhton,A,Bristol] comm_pair[E,Bringhton,A,Bringhton]
 comm_pair[E,Bringhton,A,London] comm_pair[E,Bringhton,B,Bristol]
 comm_pair[E,Bringhton,B,Bringhton] comm_pair[E,Bringhton,B,London]
 comm_pair[E,Bringhton,C,Bristol] comm_pair[E,Bringhton,C,Bringhton]
 comm_pair[E,Bringhton,C,London] comm_pair[E,Bringhton,D,Bristol]
 comm_pair[E,Bringhton,D,Bringhton] comm_pair[E,Bringhton,D,London]
 comm_pair[E,Bringhton,E,Bristol] comm_pair[E,Bringhton,E,Bringhton]
 comm_pair[E,Bringhton,E,London] comm_pair[E,London,A,Bristol]
 comm_pair[E,London,A,Bringhton] comm_pair[E,London,A,London]
 comm_pair[E,London,B,Bristol] comm_pair[E,London,B,Bringhton]
 comm_pair[E,London,B,London] comm_pair[E,London,C,Bristol]
 comm_pair[E,London,C,Bringhton] comm_pair[E,London,C,London]
 comm_pair[E,London,D,Bristol] comm_pair[E,London,D,Bringhton]
 comm_pair[E,London,D,London] comm_pair[E,London,E,Bristol]
 comm_pair[E,London,E,Bringhton] comm_pair[E,London,E,London]
End
