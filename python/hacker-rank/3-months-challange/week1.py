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


# mini-max sum
# excercise description - https://www.hackerrank.com/challenges/three-month-preparation-kit-mini-max-sum/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
# solution a
def miniMaxSum(arr):
    max, min = arr[0], arr[0]
    sum = 0
    for x in arr:
        sum += x
        if max < x:
            max = x
        if min > x:
            min = x
    print(f'{sum - max} {sum - min}')

# solution b
def miniMaxSum(arr):
    arr.sort()
    min, max = arr[0], arr[-1]
    sum = 0
    for x in arr:
        sum += x
    print(f'{sum - max} {sum - min}')

# Given a time in 12-hour AM/PM format, convert it to military (24-hour) time. 
# https://www.hackerrank.com/challenges/three-month-preparation-kit-time-conversion/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
# TODO
def timeConversion(s):
    arr = s.split(':')
    hh, midday = arr[0], arr[2][-2:]
    if midday == 'PM':
        if hh != '12':
            s = s.replace(hh, str(int(hh) + 12))
    else:
        if hh == '12':
            s = s.replace(hh, '00')
    return s[:-2]


# Given the scores for a season, determine the number of times Maria breaks her records for most and least points scored during the season.
# https://www.hackerrank.com/challenges/three-month-preparation-kit-breaking-best-and-worst-records/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
def breakingRecords(scores):
    res = [0, 0]
    min_score, max_score = scores[0], scores[0]
    for score in scores[1:]:
        if score < min_score:
            min_score = score
            res[1] += 1
        elif score > max_score:
            max_score = score
            res[0] += 1
    return res


# Given an array of integers and a positive integer k, determine the number of pairs where i < j and arr[i] + arr[j] is divisible by k. 
# https://www.hackerrank.com/challenges/three-month-preparation-kit-divisible-sum-pairs/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
def divisibleSumPairs(n, k, ar):
    n_pairs = 0
    for i in range(n):
        for j in range(i+1, n):
            if ar[i] + ar[j] % k == 0:
                n_pairs += 1
    return n_pairs


# There is a collection of input strings and a collection of query strings. For each query string, determine how many times 
# it occurs in the list of input strings. Return an array of the results. 
# https://www.hackerrank.com/challenges/three-month-preparation-kit-sparse-arrays/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
def matchingStrings(strings, queries) -> list:
    result = []
    for query in queries: 
        n = 0
        for str in strings: 
            if query == str: 
                n += 1
        result.append(n)
    return result

# Write a program that creates or splits Camel Case variable, method, and class names
# link: https://www.hackerrank.com/challenges/three-month-preparation-kit-camel-case/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
def camel_case(line):
    y = line[2:3]
    arr = list(line[4:])  # str to arr
    if line[:1] == 'S':
        for i, char in enumerate(arr):
            if char.isupper():  # see if a char is upper
                arr[i] = ' ' + char.lower()  # upper to lower
        if y == 'M':
            print(''.join(arr)[:-2])
        else:
            print(''.join(arr).lstrip()) 
    else: # if x == c
        for i, char in enumerate(arr):
            if char == ' ':
                arr[i+1] = arr[i+1].upper()
        if y == 'M':
            print(''.join(arr).replace(' ', '') + '()')
        else:
            if y == 'C':
                arr[0] = arr[0].upper()
            print(''.join(arr).replace(' ', ''))