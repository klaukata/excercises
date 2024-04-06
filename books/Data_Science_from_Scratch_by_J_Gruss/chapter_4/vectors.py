from typing import List

Vector = List[float]

# adding two vectors
def add(x: Vector, y: Vector):
    assert len(x) == len(y), 'both vectors need to have the same length'
    return list(i + j for i, j in zip(x, y))
# print(add([1,2,3], [4,5,6]))

# scalar vecor
def scalar(c: float, v: Vector) -> Vector:
    return list(c * v_i for v_i in v)
print(scalar(4, [1,2,4]))