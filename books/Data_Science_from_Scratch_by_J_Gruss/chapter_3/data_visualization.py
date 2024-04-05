from matplotlib import pyplot as plt

y = [1652, 1998, 2015, 2024]
money = [300, 42548, 751, 17232]

plt.bar(range(len(y)), money)

plt.title('nominal income')

plt.xticks(range(len(y)), y)

plt.show()