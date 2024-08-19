import itertools as it 

def read_file():
    params = {}
    data = [1.5, 1.5, 1.5, 0.75,
        1.5, 2.0, 1.5, 0.75,
        1.0, 1.0, 0.75, 0.5,
        0.75, 0.75, 0.5, 0.25,
        4.0, 4.0, 2.0,
        3.0, 3.0, 1.0,
        2.0, 2.0, 0.5,
        12.0, 6.0,
        5.0, 4.0,
        6.0]
    blocks = []
    levels = list(range(1,5))
    for l in levels:
        horiz = list(range(1,6-l))
        blocks.extend(list(it.product([l],horiz,horiz)))
    params['blocks'] = blocks
    above_blocks = {}
    for b in blocks :
        if b[0]==1:
            above_blocks[b] =[]
        else:
            above  = [(b[0]-1,b[1],b[2]),
                      (b[0]-1,b[1]+1,b[2]),
                      (b[0]-1,b[1],b[2]+1),
                      (b[0]-1,b[1]+1,b[2]+1)]
            above_blocks[b] = above
    params['above_blocks'] = above_blocks
    whole_price = 200000
    block_value = dict(zip(blocks, [d/100*whole_price for d in data]))
    params['block_value'] = block_value
    extract_cost = dict(zip(levels, [3000, 6000, 8000, 10000]))
    params['extract_cost'] = extract_cost
    return params
    
    
        
    
            
            
            
        
        
        
        
   
    