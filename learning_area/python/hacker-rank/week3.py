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