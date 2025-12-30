# list comprehensions:
#  You are given three integers  and  representing the dimensions of a cuboid along with an integer . 
# Print a list of all possible coordinates given by  on a 3D grid where the sum of  is not equal to . 
# Here, . Please use list comprehensions rather than multiple loops, as a learning exercise.

# Print an array of the elements that do not sum to n.




if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    
    cords = []
    l = []
    
    for i in range(0,x+1):
        for j in range(0,y+1):
            for k in range(0,z+1):
                if((i+j+k)!= n ):
                    l.append([i,j,k])
                else:
                    continue
                
         
                    
                
    print(l)