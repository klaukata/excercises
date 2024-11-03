# Lonely Integer
# Link: https://www.hackerrank.com/challenges/three-month-preparation-kit-lonely-integer/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two

# solution 1
def lonelyinteger(a):
    a.sort()
    for i in range(1, len(a), 2):
        if a[i] == a[i - 1]:
            continue
        else:
            return a[i - 1]
    return a[-1]

# solution 2
def lonelyinteger2(a):
    for x in a:
        if a.count(x) == 1:
            return x

# Grading Students
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-grading/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
def gradingStudents(grades):
    res = []
    for grade in grades:
        if grade >= 38:
            mult_five = ((grade // 5) + 1) * 5
            if mult_five - grade < 3:
                grade = mult_five
        res.append(grade)
    return res

# Flipping bits
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-flipping-bits/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
# TODO
def flippingBits(n):
    bin_str = format(n, '032b')
    bin_arr = list(map(int, bin_str))
    for i, b in enumerate(bin_arr):
        bin_arr[i] ^= 0b1
    inv_str = ''.join(str(bi) for bi in bin_arr)
    inv_num = int(inv_str, 2)
    return inv_num

# Diagonal Difference
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-diagonal-difference/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
def diagonalDifference(arr):
    s1, s2 = 0, 0
    i1 = 0
    i2 = len(arr) - 1
    for a in arr:
        s1 += a[i1]
        s2 += a[i2]
        i1 += 1
        i2 -= 1
    return abs(s1 - s2)

# Counting Sort 1
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-countingsort1/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
def countingSort(arr):
    res = [0] * 100
    for el in arr:
        res[el] += 1
    return res