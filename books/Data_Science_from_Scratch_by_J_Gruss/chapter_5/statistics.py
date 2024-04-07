from matplotlib import pyplot as plt
from collections import Counter
from typing import List
import numpy as np

num_friends = [100, 49, 41, 40, 25]


# calculating mean
def mean(x: List[float]) -> float:
    return sum(x) / len(x)


# median (odd)
def median_odd(x: List[float]) -> float:
    l = len(x)
    return sorted(x)[l // 2]

# median (even)
def median_even(x: List[float]) -> float:
    srt = sorted(x)
    l = len(x) // 2
    return (srt[l] + srt[l+1]) / 2

def median(x: List[float]) -> float:
    return median_even(x) if len(x) % 2 == 0 else median_odd(x)


# quantile
def quantile(x: List[float], p: float) -> float:
    i = int(len(x) * p)
    return sorted(x)[i]
    # or return np.percentile(x, p)


print(quantile([20, 2, 7, 1, 34], .25))
