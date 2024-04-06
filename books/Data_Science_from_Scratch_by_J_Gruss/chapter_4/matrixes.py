from typing import Tuple, List

Matrix = List[List[float]]

# shape of a matrix
def shape(A : Matrix) -> Tuple[int, int]:
    rows = len(A)
    columns = len(A[0])
    return rows, columns

print(shape([[4,3], [5,2], [6, 2]]))