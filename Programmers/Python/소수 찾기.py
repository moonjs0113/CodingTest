"""
  소수 찾기(Finding Prime Numbers)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42839
  Difficulty: Lv.2
  Topic : 완전탐색
"""

from itertools import permutations
import math

def solution(numbers):
    cache = {}
    result = 0
    for l in range(1,len(numbers)+1):
        for p in permutations(range(len(numbers)),l):
            temp = ""
            for i in p:
                temp += numbers[i]
            temp = int(temp)
            if temp in cache:
                continue
            isPrimeN = isPrime(temp)
            cache[temp] = isPrimeN
            if isPrimeN:
                result += 1
    return result

def isPrime(n):
    prime = set([2,3,5,7,11,13,17,19,23])
    if n in prime: return True
    if n < 2 or n % 2 == 0 or n % 3 == 0 or n % 5 == 0: return False
    for i in range(4,int(math.sqrt(n))+1):
        if n % i == 0: return False
    return True
