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
    return [-1]

# Zig Zag Sequence
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-zig-zag-sequence/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def findZigZagSequence(a, n):
    a.sort()
    mid = int(n / 2)  # change 1
    a[mid], a[n-1] = a[n-1], a[mid]

    st = mid + 1
    ed = n - 2 # change 2
    while(st <= ed):
        a[st], a[ed] = a[ed], a[st]
        st = st + 1
        ed = ed - 1 # change 3

    for i in range (n):
        if i == n-1:
            print(a[i])
        else:
            print(a[i], end = ' ')
    return

# Drawing Book
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-drawing-book/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-three
def pageCount(n, p):
    page_n = None
    if n % 2 == 0:
        n += 1
    half = n / 2
    if p < half:
        if p % 2 != 0:
            p -= 1
        page_n = p // 2
    else:
        if p % 2 == 0:
            p += 1
        page_n = (n - p) // 2
    return page_n