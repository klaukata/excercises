from matplotlib import pyplot as plt
from collections import Counter

grades=[83, 23, 95, 92, 70, 0, 77, 94, 55, 83]

histogram1=Counter(min(grade // 10 * 10, 90) for grade in grades)

plt.bar([x + 5 for x in histogram1.keys()],
         histogram1.values(),
         10)
plt.axis((-5, 105, 0, 5))

plt.show()