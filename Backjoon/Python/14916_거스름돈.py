"""
 거스름돈
 https://www.acmicpc.net/problem/14916
"""

n = int(input())
result = -1
if not (n == 1 or n == 3):
    result = (n // 5) + ((n % 5) // 2) if ((n % 5) % 2 == 0) else (n // 5) - 1 + ((n % 5) + 5) // 2
print(result)
