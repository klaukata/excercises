# Arrays - DS
# LINK - https://www.hackerrank.com/challenges/arrays-ds/problem?isFullScreen=true
# TODO
def reverseArray(a):
    res = []
    for i in range(len(a) - 1, -1, -1):
        res.append(a[i])
    return res