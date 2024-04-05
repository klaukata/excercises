from matplotlib import pyplot as plt
from collections import Counter

grades=[83, 23, 95, 92, 70, 0, 77, 94, 55, 83]

histogram=Counter(grade for grade in grades)
histogram1=Counter(min(grade // 10 * 10, 90) for grade in grades)

plt.scatter(grades, grades)
# plt.bar([x + 5 for x in histogram.keys()],
#         histogram.values(),
#         10)
plt.axis((-5, 120, 0, 5))
# plt.show()
print(histogram)
print(histogram1)
plt.show()
# {0: 83, 1: 23, 2: 95, ...}