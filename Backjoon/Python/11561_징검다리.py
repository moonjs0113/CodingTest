"""
 징검다리
 https://www.acmicpc.net/problem/11561
"""

import math
for i in range(int(input())):
  n = int(input())
  nx = int(math.sqrt(n*2))
  c = n*2 // (nx+1)
  while not (nx <= c and c <= (nx + 2)) :
    nx -= 1
    c = n*2 // (nx+1)
  print(nx)
