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