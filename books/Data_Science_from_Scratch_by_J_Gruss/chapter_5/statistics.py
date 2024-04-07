from matplotlib import pyplot as plt
from collections import Counter
from typing import List

num_friends = [100, 32, 60, 400, 400, 32, 63, 30, 24, 21]

# calculating mean
def mean(x: List[float]) -> float:
    return sum(x) / len(x)



print(mean(num_friends))
