"""
 게임
 https://www.acmicpc.net/problem/1072
"""

x, y = map(int,input().split())
if x == y or ((y * 100) // x) == 99:
  print(-1)
else:
  z = (y * 100) // x
  numerator = (((z + 1) * x) - (100 * y))
  denominator = 99 - z
  result = numerator // denominator
  print(result if numerator % denominator == 0 else result + 1)
