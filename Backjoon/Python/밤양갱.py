"""
 밤양갱
 https://www.acmicpc.net/problem/31926
"""

n = int(input())
count = 0
while (1 << count) < n:
    count += 1
print(10 + count - (0 if (1 << count) == n else 1))
