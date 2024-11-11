"""
 카드 문자열
 https://www.acmicpc.net/problem/13417
"""

for _ in range(int(input())):
    n = int(input())
    cards = input().split()
    result = cards[0]
    for i in range(1,n):
        result = cards[i] + result if cards[i] <= result[0] else result + cards[i]
    print(result)
