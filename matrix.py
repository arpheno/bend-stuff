import numpy as np
import sys

def matrix_mul(M, N):
    return np.dot(M, N)


def main():
    stacked = [[1, 2], [3, 5]]
    stacked=[
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
[1,2,3,4,5,6,7,8,9,0],
]
    stacked2=np.array(stacked)
    stacked3=np.array(stacked)
    for i in range(int(sys.argv[1])):
        stacked+=np.dot(stacked2,stacked2)
    return stacked


# Calling the main function to execute the code
result = main()
print(result)

