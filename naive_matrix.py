def matrix_mul(A, B):
    # Get the number of rows and columns of the input matrices
    rows_A, cols_A = len(A), len(A[0])
    rows_B, cols_B = len(B), len(B[0])

    # Ensure the matrices can be multiplied (i.e., cols_A == rows_B)
    if cols_A != rows_B:
        raise ValueError("Cannot multiply matrices: incompatible dimensions.")

    # Compute the result of the matrix multiplication
    result = [[sum(A[i][k] * B[k][j] for k in range(cols_A)) for j in range(cols_B)] for i in range(rows_A)]

    return result
def matrix_add(A, B):
    # Get the number of rows and columns of the input matrices
    rows_A, cols_A = len(A), len(A[0])
    rows_B, cols_B = len(B), len(B[0])

    # Ensure the matrices have the same dimensions
    if rows_A != rows_B or cols_A != cols_B:
        raise ValueError("Cannot add matrices: incompatible dimensions.")

    # Compute the result of the matrix addition
    result = [[A[i][j] + B[i][j] for j in range(cols_A)] for i in range(rows_A)]

    return result
import sys
def main():
    # Example matrices (can be replaced with the matrices of choice)
    x=10
    stacked = [[i for i in range(x)] for j in range(x)] 
    stacked2 = [[i for i in range(x)] for j in range(x)] 
    # Perform matrix multiplication
    result = stacked
    for i in range(int(sys.argv[1])):
        result = matrix_add(result,matrix_mul(stacked, stacked2))
    

if __name__ == "__main__":
    main()

