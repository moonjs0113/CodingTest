"""
 예산
 https://www.acmicpc.net/problem/2512
"""

import sys
input = sys.stdin.read
data = input().split()

n = int(data[0])
cost = list(map(int,data[1:1+n]))
m = int(data[-1])
right = max(cost)
if sum(cost) <= m:
  print(right)
else:
  result = 0
  left = 0
  while left <= right:
    mid = (left + right) // 2
    costSum = 0
    for c in cost:
      costSum += min(c,mid)
    if costSum <= m:
      result = mid
      left = mid + 1
      if costSum == m:
        break
    else:
      right = mid - 1
  print(result)
