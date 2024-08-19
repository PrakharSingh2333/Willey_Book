def read_file():
    params = {}
    params['block'] = [(i,j,k) for i in range(1,4) for j in range(1,4) for k in range(1,4)]
    params['lines'] = []
    for i in range(1,4):
        for j in range(1,4):
            for k in range(1,4):
                if i == 1:
                    params['lines'].append(((1,j,k), (2,j,k), (3,j,k)))
                if j == 1:
                    params['lines'].append(((i,1,k), (i,2,k), (i,3,k)))
                if k == 1:
                    params['lines'].append(((i,j,1), (i,j,2), (i,j,3)))
                if i == 1 and j == 1:
                    params['lines'].append(((1,1,k), (2,2,k), (3,3,k)))
                if i == 1 and j == 3:
                    params['lines'].append(((1,3,k), (2,2,k), (3,1,k)))
                if i == 1 and k == 1:
                    params['lines'].append(((1,j,1), (2,j,2), (3,j,3)))
                if i == 1 and k == 3:
                    params['lines'].append(((1,j,3), (2,j,2), (3,j,1)))
                if j == 1 and k == 1:
                    params['lines'].append(((i,1,1), (i,2,2), (i,3,3)))
                if j == 1 and k == 3:
                    params['lines'].append(((i,1,3), (i,2,2), (i,3,1)))
    params['lines'].append(((1,1,1), (2,2,2), (3,3,3)))
    params['lines'].append(((3,1,1), (2,2,2), (1,3,3)))
    params['lines'].append(((1,3,1), (2,2,2), (2,1,2)))
    params['lines'].append(((1,1,3), (2,2,2), (3,3,1))) 
    return params

            
       