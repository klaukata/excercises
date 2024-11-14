# Permuting Two Arrays
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-two-arrays/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def twoArrays(k, A, B):
    res = 'YES'
    A.sort()
    B.sort(reverse=True)
    for i in range(len(A)):
        su = A[i] + B[i]
        if su < k:
            res = 'NO'
            break
    return res

# Subarray Division 2
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-the-birthday-bar/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
# TODO 
def birthday(s, d, m):
    res = 0
    for i in range(len(s) - m + 1):
        sum = 0
        for j in range(i, i + m):
            sum += s[j]
        if sum == d:
            res += 1
    return res

# XOR Strings 3
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-strings-xor/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def strings_xor(s, t):
    res = ""
    for i in range(len(s)):
        if int(s[i]) ^ int(t[i]) == 1:
            res += '1'
        else:
            res += '0'

    return res

# Sales by Match
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-sock-merchant/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def sockMerchant(n, ar):
    pair_n = 0
    for i, sock in enumerate(ar):
        if sock in ar[i+1:] and sock is not None:
            ar[i] = None
            pair_i = ar.index(sock)
            ar[pair_i] = None
            pair_n += 1
        else:
            continue
    return pair_n

# Migratory Birds
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-migratory-birds/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def migratoryBirds(arr):
    d = {}
    for bird_id in arr:
        if bird_id not in d.keys():
            d[bird_id] = 1
        else:
            d[bird_id] += 1
    max_sightings_n = max(d.values())
    birds_w_max_sightings = [bird_id for bird_id, sightings_n in d.items() if sightings_n == max_sightings_n]
    return min(birds_w_max_sightings)

# Maximum Perimeter Triangle
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-maximum-perimeter-triangle/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def maximumPerimeterTriangle(sticks):
    sticks.sort(reverse=True)
    for i in range(len(sticks) - 2):
        c, b, a = sticks[i:i+3]
        if a + b > c:
            return a, b, c
        print(sticks[i:i+3])
    return [-1]