# Picking Numbers
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-picking-numbers/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-four
# TODO
def pickingNumbers(a):
    cnt = [0] * (max(a) + 1)
    for n in a:
        cnt[n] += 1
    res = 0
    for i in range(len(cnt) - 1):
        cnt_sum = cnt[i] + cnt[i+1]
        if cnt_sum > res:
            res = cnt_sum
    return res

#   Left Rotation
#   LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-array-left-rotation/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-four

def rotateLeft(d, arr):
    left_side = arr[d:]
    right_side = arr[:d]
    return left_side + right_side

#   Number Line Jumps
#   LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-kangaroo/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-four

def kangaroo(x1, v1, x2, v2):
    isRunning = True
    k1 = [x1, v1]
    k2 = [x2, v2]
    vals = [k1, k2] if x1 < x2 else [k2, k1]    # vals = [[smallerX, smallerV], [biggerX, biggerV]]
    while (isRunning):
        if vals[0][0] > vals[1][0] or vals[1][1] >= vals[0][1]: # if smallerX > biggerX or biggerV >= smallerV
            return "NO"
        vals[0][0] += vals[0][1]    # smallerX = smallerX + smallerV
        vals[1][0] += vals[1][1]    # biggerX = biggerX + biggerV
        if vals[0][0] == vals[1][0]:    # if smallerX == biggerX
            return "YES"

print(kangaroo(0, 2, 5, 3))