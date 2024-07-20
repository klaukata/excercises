# excercise description - https://www.hackerrank.com/challenges/three-month-preparation-kit-plus-minus/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
# TODO
# solution 1
def plusMinus1(arr):
    arr_len = len(arr)
    positive = 0
    neutral = 0
    negative = 0
    for x in arr:
        if x > 0:
            positive += 1
        elif x < 0:
            negative += 1
        else:
            neutral += 1
    print(f'{round(positive / arr_len, 6):.6f}')
    print(f'{round(negative / arr_len, 6):.6f}')
    print(f'{round(neutral / arr_len, 6):.6f}')
    
# solution 2
def plusMinus(arr):
    answ = [0, 0, 0]
    for x in arr:
        if x > 0:
            answ[0] += 1
        elif x < 0:
            answ[1] += 1
        else:
            answ[2] += 1
    for val in answ:
        print(f'{round(val / len(arr), 6):.6f}')


x = [1,1,0,-1,-1]
plusMinus(x)